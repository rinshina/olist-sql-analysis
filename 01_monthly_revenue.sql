-- Revenue = sum of item price for delivered orders (excludes freight)
SELECT TO_CHAR(DATE_TRUNC('month', o.order_purchase_timestamp), 'YYYY-MM') AS month,
       SUM(oi.price) AS monthly_revenue
FROM order_items AS oi
INNER JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;