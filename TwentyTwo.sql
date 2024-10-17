with t as (select player_id, min(event_date) as event_date from Activity group by player_id)

select round(sum(t.player_id is not null)/count(distinct Activity.player_id), 2) as fraction from Activity left join t
on Activity.player_id = t.player_id
and datediff(Activity.event_date, t.event_date) = 1;