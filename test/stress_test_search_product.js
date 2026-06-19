import http from "k6/http";
import { check, sleep } from "k6";
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";

export const options = {
  stages: [
    { duration: "1m", target: 200 }, // Cepat naik ke beban normal
    { duration: "2m", target: 500 }, // Naik ke beban berat (stress)
    { duration: "2m", target: 800 }, // Puncak beban (extreme)
    { duration: "1m", target: 0 }, // Ramp-down cepat
  ],
  thresholds: {
    http_req_failed: ["rate<0.01"], // Gagal jika error rate > 1%
    http_req_duration: ["p(95)<2000"], // 95% request harus di bawah 2 detik
  },
};

const BASE_URL = __ENV.BASE_URL || "http://localhost:1323";
const EMAIL = __ENV.EMAIL;
const PASSWORD = __ENV.PASSWORD;

export function setup() {
  if (!EMAIL || !PASSWORD) {
    throw new Error("EMAIL and PASSWORD environment variables are required.");
  }

  const loginPayload = JSON.stringify({
    email: EMAIL,
    password: PASSWORD,
  });

  const loginParams = {
    headers: {
      "Content-Type": "application/json",
    },
  };

  const loginRes = http.post(
    `${BASE_URL}/auth/login`,
    loginPayload,
    loginParams,
  );

  if (loginRes.status !== 200) {
    throw new Error(`Setup login failed: ${loginRes.body}`);
  }

  return { token: loginRes.json("access_token") };
}

export default function (data) {
  const authParams = {
    headers: {
      Authorization: `Bearer ${data.token}`,
      "Content-Type": "application/json",
    },
  };

  // Simulate think time
  sleep(1);

  // 1. Search Products
  const searchRes = http.get(`${BASE_URL}/products`, authParams);

  const searchCheck = check(searchRes, {
    "search status is 200": (r) => r.status === 200,
    "is array": (r) => Array.isArray(r.json()),
  });

  if (!searchCheck) {
    console.error(`Search failed: ${searchRes.body}`);
    return;
  }

  const products = searchRes.json();

  if (products && products.length > 0) {
    // 2. Get Details of a random product from the list
    const randomIndex = Math.floor(Math.random() * products.length);
    const productId = products[randomIndex].id;

    // Simulate think time
    sleep(1);

    const detailRes = http.get(`${BASE_URL}/products/${productId}`, authParams);

    check(detailRes, {
      "get detail status is 200": (r) => r.status === 200,
      "product id matches": (r) => r.json("id") === productId,
    });
  } else {
    console.log("No products found in search result.");
  }

  // Final think time before next iteration
  sleep(1);
}

export function handleSummary(data) {
  return {
    "stress_test_report.html": htmlReport(data),
  };
}
