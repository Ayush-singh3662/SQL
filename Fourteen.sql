select SignUps.user_id, round(case when sum(Confirmations.action = 'confirmed')/count(Confirmations.action) is null then 0 else sum(Confirmations.action = 'confirmed')/count(Confirmations.action) end, 2) as confirmation_rate
from SignUps left join Confirmations
on SignUps.user_id = Confirmations.user_id
group by SignUps.user_id