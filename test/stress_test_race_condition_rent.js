import http from "k6/http";
import { check, sleep } from "k6";
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";

export const options = {
  stages: [
    { duration: "1m", target: 200 }, // Cepat naik ke 200 VU
    { duration: "2m", target: 500 }, // Stress: Naik ke 500 VU
    { duration: "2m", target: 800 }, // Peak: 800 VU menyerang bersamaan
    { duration: "1m", target: 0 }, // Ramp-down cepat
  ],
  thresholds: {
    http_req_failed: ["rate<0.01"], // Sangat ketat karena 409 sudah dianggap sukses secara global
    http_req_duration: ["p(95)<3000"], // 95% request harus selesai di bawah 3 detik saat stress
  },
};

const BASE_URL = __ENV.BASE_URL || "http://localhost:1323";
const OWNER_EMAIL = __ENV.OWNER_EMAIL;
const OWNER_PASSWORD = __ENV.OWNER_PASSWORD;
const RENTER_EMAIL = __ENV.RENTER_EMAIL;
const RENTER_PASSWORD = __ENV.RENTER_PASSWORD;

// Treat 200-399 AND 409 as "expected" (not failed)
http.setResponseCallback(http.expectedStatuses({ min: 200, max: 399 }, 409));

export function setup() {
  if (!OWNER_EMAIL || !RENTER_EMAIL) {
    throw new Error(
      "OWNER_EMAIL and RENTER_EMAIL environment variables are required.",
    );
  }

  // Login as Owner
  const ownerLoginRes = http.post(
    `${BASE_URL}/auth/login`,
    JSON.stringify({
      email: OWNER_EMAIL,
      password: OWNER_PASSWORD,
    }),
    { headers: { "Content-Type": "application/json" } },
  );

  if (ownerLoginRes.status !== 200) {
    throw new Error(`Owner login failed: ${ownerLoginRes.body}`);
  }
  const ownerToken = ownerLoginRes.json("access_token");
  const ownerHeaders = {
    Authorization: `Bearer ${ownerToken}`,
    "Content-Type": "application/json",
  };

  // Login as Renter
  const renterLoginRes = http.post(
    `${BASE_URL}/auth/login`,
    JSON.stringify({
      email: RENTER_EMAIL,
      password: RENTER_PASSWORD,
    }),
    { headers: { "Content-Type": "application/json" } },
  );

  if (renterLoginRes.status !== 200) {
    throw new Error(`Renter login failed: ${renterLoginRes.body}`);
  }
  const renterToken = renterLoginRes.json("access_token");

  // Get an address ID
  const addressRes = http.get(`${BASE_URL}/addresses`, {
    headers: ownerHeaders,
  });
  const addressId = addressRes.json()[0].id;

  // Create Product with high stock for stress test
  const productRes = http.post(
    `${BASE_URL}/me/products`,
    JSON.stringify({
      name: "Stress Test Race Condition Product",
      address_id: addressId,
      price_per_day: 10000,
      late_fee_per_day: 5000,
      stock: 1000, // Stok lebih banyak untuk melihat seberapa jauh concurrency berjalan
      description:
        "Product created for high-concurrency race condition stress testing.",
    }),
    { headers: ownerHeaders },
  );

  if (productRes.status !== 201 && productRes.status !== 200) {
    throw new Error(`Product creation failed: ${productRes.body}`);
  }

  const productId = productRes.json("id");
  console.log(`Setup: Created product ${productId} with stock 1000`);

  return { productId, ownerToken, renterToken };
}

export default function (data) {
  const authHeaders = {
    Authorization: `Bearer ${data.renterToken}`,
    "Content-Type": "application/json",
  };

  const startDate = new Date();
  startDate.setDate(startDate.getDate() + 14); // Sewa untuk 2 minggu ke depan
  const endDate = new Date(startDate);
  endDate.setDate(endDate.getDate() + 1);

  const payload = JSON.stringify({
    start_date: startDate.toISOString(),
    end_date: endDate.toISOString(),
    quantity: 1,
  });

  const rentRes = http.post(
    `${BASE_URL}/products/${data.productId}/rent`,
    payload,
    { headers: authHeaders },
  );

  // Pada stress test, kita pantau apakah server mulai mengembalikan 500 (Internal Server Error)
  // yang menandakan database lock atau masalah konkurensi serius.
  check(rentRes, {
    "is success (200) or out of stock (409)": (r) =>
      r.status === 200 || r.status === 409,
    "is success (200)": (r) => r.status === 200,
    "is not server error (500)": (r) => r.status !== 500,
  });

  sleep(1);
}

export function teardown(data) {
  const headers = { Authorization: `Bearer ${data.ownerToken}` };
  const delRes = http.del(`${BASE_URL}/me/products/${data.productId}`, null, {
    headers,
  });

  if (delRes.status === 200) {
    console.log(`Teardown: Successfully deleted product ${data.productId}`);
  } else {
    console.error(
      `Teardown: Failed to delete product ${data.productId}. Status: ${delRes.status}`,
    );
  }
}

export function handleSummary(data) {
  return {
    "stress_race_condition_report.html": htmlReport(data),
  };
}
