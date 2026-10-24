-- Payment value includes freight, so it will not match item-price revenue in Q1
select 
	op.payment_type,
	count(distinct op.order_id) as orders,
	sum(op.payment_value) as payment,
	ROUND(SUM(op.payment_value) * 100.0 / SUM(SUM(op.payment_value)) OVER (), 2) AS pct_of_value
from order_payments as op
inner join orders as o on o.order_id=op.order_id
where o.order_status='delivered'
group by op.payment_type
order by 3 desc