-- Repeat customer = customer_unique_id with 2+ delivered orders (customer_id is per-order, so it can't be used)
WITH customer_orders AS (
  SELECT c.customer_unique_id AS customer,
         COUNT(DISTINCT o.order_id) AS orders
  FROM customers AS c
  INNER JOIN orders AS o ON o.customer_id = c.customer_id
  WHERE o.order_status = 'delivered'
  GROUP BY 1
)
SELECT CASE WHEN orders = 1 THEN 'one-time' ELSE 'repeat' END AS customer_type,
       COUNT(*) AS customers,
       SUM(orders) AS total_orders
FROM customer_orders
GROUP BY 1;