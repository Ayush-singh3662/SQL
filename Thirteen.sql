with t as (select e1.name, count(e1.id) as count from Employee as e1
join Employee as e2
on e1.id = e2.managerId
group by e1.id)

select name from t where count >= 5