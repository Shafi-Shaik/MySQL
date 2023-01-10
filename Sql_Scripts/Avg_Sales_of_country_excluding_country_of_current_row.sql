with cte as 
(
select 'ind' as country, 100 as sales
union all
select 'aus' as country, 200 as sales
union all
select 'can' as country, 300 as sales
union all
select 'ind' as country, 400 as sales
)

select a.country,a.sales, avg(b.sales) as avg_excluding_current_country
from cte a
join cte b 
 on a.country != b.country
group by a.country,a.sales
order by a.sales 
;

   -- Method 2
-- select a.country,
-- 		a.sales,
-- 		(select avg(sales) from cte b where b.country<> a.country)
-- from cte a
-- order by a.sales
-- ;
