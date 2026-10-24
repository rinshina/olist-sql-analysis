-- AOV = delivered-order item revenue / number of delivered orders (excludes freight)
SELECT 
	TO_CHAR(DATE_TRUNC('month',o.order_purchase_timestamp),'YYYY-MM') AS Month,
	SUM(oi.price) AS revenue,
	COUNT(DISTINCT order_item_id) AS orders,
	ROUND(SUM(oi.price) / COUNT(DISTINCT order_item_id),2) as AOV
FROM orders AS o
INNER JOIN order_items AS oi ON o.order_id=oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;
