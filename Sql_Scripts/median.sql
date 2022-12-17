############ Median ##################
select * from shafidb.median limit 1,3;
select *, case when a.row_number between a.lower and a.upper then 'eligible' else null end median_eligible
from (
  select d.val, @rownum:=@rownum+1 as `row_number`, lower,upper
  from median d, 
       (select @rownum:=0, count(*)/2 as lower,(count(*)/2)+1 as upper from median) z 
  where d.val is not null
  order by d.val 
  ) a
