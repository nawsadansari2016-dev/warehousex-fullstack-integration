-- SQL schema (simplified) + optimized query example

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  status VARCHAR(32),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(id),
  product_id INT,
  quantity INT
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  sku TEXT,
  name TEXT,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE inventory (
  product_id INT PRIMARY KEY,
  available_qty INT
);

-- Optimized query: fetch recent active orders with product and inventory info
WITH recent_orders AS (
  SELECT o.id, o.customer_id, o.status, o.updated_at
  FROM orders o
  WHERE o.updated_at >= now() - interval '7 days'
    AND o.status IN ('PENDING','PROCESSING')
)
SELECT ro.id AS order_id,
       ro.customer_id,
       ro.status,
       oi.product_id,
       oi.quantity,
       p.sku,
       p.name,
       inv.available_qty
FROM recent_orders ro
JOIN order_items oi ON oi.order_id = ro.id
JOIN products p ON p.id = oi.product_id
LEFT JOIN inventory inv ON inv.product_id = p.id
WHERE p.is_active = TRUE
ORDER BY ro.updated_at DESC
LIMIT 1000;
