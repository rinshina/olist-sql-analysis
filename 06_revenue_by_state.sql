-- Revenue = delivered item price, by buyer state
SELECT c.customer_state AS state,
       SUM(oi.price) AS revenue,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(SUM(oi.price) * 100.0 / SUM(SUM(oi.price)) OVER (), 1) AS pct_revenue,
       ROUND(COUNT(DISTINCT o.order_id) * 100.0 / SUM(COUNT(DISTINCT o.order_id)) OVER (), 1) AS pct_orders
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;