import http from "k6/http";
import { check, sleep } from "k6";
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";

export const options = {
  stages: [
    { duration: "30s", target: 100 }, // Ramp-up to 100 VUs over 30 seconds
    { duration: "30s", target: 100 }, // Stay at 100 VUs for 30 seconds
    { duration: "10s", target: 0 }, // Ramp-down
  ],
  thresholds: {
    http_req_failed: ["rate<0.5"], // We expect some failures due to stock limits, but not too many
  },
};

const BASE_URL = __ENV.BASE_URL || "http://localhost:1323";
const OWNER_EMAIL = __ENV.OWNER_EMAIL;
const OWNER_PASSWORD = __ENV.OWNER_PASSWORD;
const RENTER_EMAIL = __ENV.RENTER_EMAIL;
const RENTER_PASSWORD = __ENV.RENTER_PASSWORD;

http.setResponseCallback(http.expectedStatuses({ min: 200, max: 399 }, 409));

// 1. Setup runs once before the test starts
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

  // Create Product with Stock: 50
  const productRes = http.post(
    `${BASE_URL}/me/products`,
    JSON.stringify({
      name: "Load Test Product (Race Condition)",
      address_id: addressId,
      price_per_day: 10000,
      late_fee_per_day: 5000,
      stock: 50,
      description: "Product created for race condition load testing.",
    }),
    { headers: ownerHeaders },
  );

  if (productRes.status !== 201 && productRes.status !== 200) {
    throw new Error(`Product creation failed: ${productRes.body}`);
  }

  const productId = productRes.json("id");
  console.log(`Setup: Created product ${productId} with stock 50`);

  return { productId, ownerToken, renterToken };
}

// 2. VU Logic: Many users attempt to rent concurrently
export default function (data) {
  const authHeaders = {
    Authorization: `Bearer ${data.renterToken}`,
    "Content-Type": "application/json",
  };

  // Set a fixed date for all VUs (7 days from now)
  const startDate = new Date();
  startDate.setDate(startDate.getDate() + 7);
  const endDate = new Date(startDate);
  endDate.setDate(endDate.getDate() + 1);

  const payload = JSON.stringify({
    start_date: startDate.toISOString(),
    end_date: endDate.toISOString(),
    quantity: 1,
  });

  // Concurrent request to rent the product
  const rentRes = http.post(
    `${BASE_URL}/products/${data.productId}/rent`,
    payload,
    { headers: authHeaders },
  );

  // In race condition testing, we expect either 200 (Success) or 409 (Out of Stock)
  // If the server handles concurrency correctly, total 200s should not exceed stock
  check(rentRes, {
    "is success or out of stock": (r) => r.status === 200 || r.status === 409,
  });
  check(rentRes, {
    "is success": (r) => r.status === 200,
  });

  sleep(1);
}

// 3. Teardown runs once after the test finishes
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
    "race_condition_test_report.html": htmlReport(data),
  };
}
