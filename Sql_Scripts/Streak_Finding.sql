-- Find the team who has won 3 consecutive times and print all winning match_ids 
-- consider match_id as an identifier to determine next match as there is no date.

-- Find the team who has won 3 consecutive times and print all winning match_ids 
WITH CTE as (
	SELECT *,
		  case when ( won_ind='Y' and
					lead(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lead(won_ind,2) over(partition by team_id order by match_id)='Y'
				) THEN 'won' 
				when ( won_ind='Y' and
					lag(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lead(won_ind,1) over(partition by team_id order by match_id)='Y' 
				) THEN 'won' 
				when ( won_ind='Y' and
					lag(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lag(won_ind,2) over(partition by team_id order by match_id)='Y'  
				) THEN 'won' 
				 else 'lose'
				 END as flag
	FROM exercise.streak
)

SELECT * FROM CTE
WHERE FLAG ='won'
;


-- Find the team who has won 3 consecutive times and print only first winning match_id for each streak


WITH CTE as (
	SELECT *,
		  case when ( won_ind='Y' and
					lead(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lead(won_ind,2) over(partition by team_id order by match_id)='Y'
				) THEN 'won' 
			/*	
            when ( won_ind='Y' and
					lag(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lead(won_ind,1) over(partition by team_id order by match_id)='Y' 
				) THEN 'won' 
				when ( won_ind='Y' and
					lag(won_ind,1) over(partition by team_id order by match_id)='Y' and 
					lag(won_ind,2) over(partition by team_id order by match_id)='Y'  
				) THEN 'won' */
				 else 'lose'
				 END as flag
	FROM exercise.streak
)

SELECT * FROM CTE
WHERE FLAG ='won'
;