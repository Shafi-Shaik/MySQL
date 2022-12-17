with cte as (
SELECT *, 
 CASE 
      WHEN Attendance='absent' 
            and lead(Attendance,1) over(partition by Name order by dated asc) ='absent'
			and lead(Attendance,2) over(partition by Name order by dated asc) ='absent'
       THEN 'absent' else 'present'
  END as Three_day_flag
FROM exercise.attendance
order by dated asc
)

Select * 
from cte
where three_day_flag='absent';

