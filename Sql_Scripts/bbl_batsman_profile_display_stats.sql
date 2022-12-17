select
striker,
sum(runs_total) as total_runs,
count(distinct match_id) as  matches_played,
round(1.0 *sum(runs_total) /
count(distinct match_id),2)as  Average_Runs,
count(case when runs_batsman >=4 then 'boundary' else null end) as boundaries,
count(case when runs_batsman =4 then 'boundary' else null end) as fours,
count(case when runs_batsman =6 then 'boundary' else null end) as sixes
from
bbl
group by 1
;
