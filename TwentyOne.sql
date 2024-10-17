with t as (select *, min(order_date) as date from Delivery group by customer_id),
t2 as (select (sum(Delivery.order_date = Delivery.customer_pref_delivery_date)/count(t.customer_id)) as p
from t left join Delivery on t.customer_id = Delivery.customer_id and Delivery.order_date = t.date
group by t.customer_id)

select round(sum(p)/count(p) * 100, 2) as immediate_percentage from t2