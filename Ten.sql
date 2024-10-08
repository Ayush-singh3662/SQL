select distinct a1.machine_id, round(avg(abs(a1.timestamp - a2.timestamp)), 3) as processing_time from Activity as a1 join Activity as a2
on a1.machine_id = a2.machine_id where a1.process_id = a2.process_id and a1.activity_type <> a2.activity_type
group by a1.machine_id