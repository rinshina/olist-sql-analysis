select p.product_category_name as Category ,sum(oi.price) as Revenue
from order_items as oi
inner join products as p on p.product_id=oi.product_id
inner join orders as o on o.order_id=oi.order_id
where o.order_status='delivered'
group by 1
order by 2 desc
limit 10