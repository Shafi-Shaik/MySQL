with cte as 
		( select a.*, lag(Attendance) over(partition by Name) as PDA #Previous day attendance
			from attendance a
			left join holidays h
			on a.dated = h.dated
			where h.dated is null
            order by dated desc
		)
        
        
select sno, Name
, case when Attendance ='absent' and PDA ='absent' then 'Yes' else 'N0' end as "last 2 days absent status"
from cte
where attendance=PDA
order by sno
        
        
        
        
        -- and dated between max(dated) and max(dated) -1 ;
        -- group by Name 
