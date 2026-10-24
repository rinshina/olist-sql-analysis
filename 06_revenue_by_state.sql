-- Revenue = delivered item price, by buyer state
SELECT c.customer_state AS state, SUM(oi.price) AS revenue,COUNT(DISTINCT o.order_id) AS orders
FROM customers as c
INNER JOIN orders as o ON c.customer_id=o.customer_id
INNER JOIN order_items AS oi ON oi.order_id=o.order_id
WHERE o.order_status='delivered'
GROUP BY c.customer_state
ORDER BY 2 DESC
LIMIT 10