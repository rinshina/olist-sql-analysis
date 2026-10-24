-- Note: 2016 months and Jan 2017 have very low volumes (and Nov 2016 has no delivered orders),
-- so growth % there is not meaningful. Use 2017-02 onward.
WITH monthly AS (
SELECT TO_CHAR(DATE_TRUNC('month', o.order_purchase_timestamp), 'YYYY-MM') AS month,
       SUM(oi.price) AS monthly_revenue
FROM order_items AS oi
INNER JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1)
SELECT month, monthly_revenue,
LAG(monthly_revenue) OVER(ORDER BY (month)) AS prev_month,
ROUND (
(monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month))/
LAG(monthly_revenue) OVER (ORDER BY month) * 100, 1) AS growth_pct
from monthly 