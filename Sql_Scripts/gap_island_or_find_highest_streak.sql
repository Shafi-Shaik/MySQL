/*
select *
from gap_island a, gap_island b, gap_island c
where a.user_id=b.user_id and a.login_date+interval 1 day=b.login_date
and  a.user_id=c.user_id and a.login_date+ interval 2 day=c.login_date;

select *
from gap_island a
inner join gap_island b
on a.user_id=b.user_id and a.login_date+interval 1 day=b.login_date
inner join gap_island c
on a.user_id=c.user_id and a.login_date+interval 2 day=c.login_date;
*/
select *, 
      row_number() over(partition by user_id) rn, 
      login_date- interval (row_number() over()) day as diff
from gap_island;

