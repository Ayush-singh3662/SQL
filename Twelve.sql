with joined as (
    select student_id, student_name, subject_name from Students cross join Subjects
)
select joined.student_id, joined.student_name, joined.subject_name as subject_name, count(Examinations.subject_name) as attended_exams from joined left join Examinations
on Examinations.student_id = joined.student_id and Examinations.subject_name = joined.subject_name
group by joined.student_name, joined.subject_name
order by joined.student_id, joined.subject_name