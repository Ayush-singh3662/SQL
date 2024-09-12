select w1.id from Weather as w1 join Weather as w2
on w1.recordDate = Date_ADD(w2.recordDate, Interval 1 Day)
and w1.temperature > w2.temperature;