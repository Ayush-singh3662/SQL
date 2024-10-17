with t1 as (
    select Prices.product_id, sum(Prices.price * UnitsSold.units) as multi from Prices
    left join UnitsSold
    on (Prices.product_id = UnitsSold.product_id or UnitsSold.product_id is null)
    and UnitsSold.purchase_date between Prices.start_date and Prices.end_date
    group by Prices.product_id
)
, 
t2 as (
    select product_id, sum(units) as s from UnitsSold 
    group by product_id
)

select t1.product_id, (case when round(t1.multi / t2.s, 2) is null then 0 else round(t1.multi / t2.s, 2) end) as average_price
from t1 
left join t2
on t1.product_id = t2.product_id