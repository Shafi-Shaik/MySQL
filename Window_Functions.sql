
/* --  1)  Top 3 employees with highest sales 

SELECT *
FROM window_functions
ORDER BY Sales DESC
LIMIT 3 ;
 
O/P: we got Ravi twice and  for Mobile category 
# Emp_Name, Year, Country, Prod_name, Sales
'Ravi', '2019', 'Canada', 'Mobile', '25000.00'
'John', '2019', 'Australia', 'TV', '20000.00'
'Ravi', '2017', 'Canada', 'Mobile', '20000.00'
*/


############################################# RANK, DENSE_RANK, ROW_NUMBER ########################################
select * , 
       rank() over(order by sales DESC) as rnk,
       dense_rank() over(order by sales DESC) as dense_rnk,
       row_number() over(order by sales DESC) as row_num
from window_functions;
/
############################################# LEAD,LAG ########################################
select * , 
       LEAD(SALES,1) over(partition by Emp_Name order by YEAR asc) as NEXT_YEAR_SALES,
       LAG(SALES,1) over(partition by Emp_Name order by YEAR asc) as PREVIOUS__YEAR_SALES
from window_functions
ORDER BY emp_name,Year ;
############################################# FIRST_VALUE,LAST_VALUE ########################################
select * , 
       first_value(SALES) over(partition by Emp_Name order by YEAR asc) as firstValue,
       LAST_VALUE(SALES) over(partition by Emp_Name order by YEAR asc) as lastValue
from window_functions
ORDER BY emp_name,Year ;

############################################# NTILE ########################################
select *,
        ntile(1) over(order by year asc) 1_tiles,
        ntile(2) over(order by year asc) 2_tiles,
        ntile(3) over(order by year asc) 3_tiles,
        ntile(4) over(order by year asc) 4_tiles
from window_functions;





##########        APPLICATION OF RANK, ROW_NUMBER,DENSE_RANK        ##########################
-- Q)WHO IS THE BEST EMPLOYEE(SALES MAN) BY PRODUCT CATEGORY

-- General Method :
select * 
from window_functions
where (prod_name,sales) in 
( select prod_name,max(sales)
FROM window_functions
group by Prod_name
);

--  Window_functions Method:
SELECT *
FROM (
	SELECT * , 
		   rank() over(PARTITION BY Prod_name order by sales DESC) as rnk,
		   dense_rank() over(PARTITION BY Prod_name order by sales DESC) as dense_rnk,
		   row_number() over(PARTITION BY Prod_name order by sales DESC) as row_num
	FROM window_functions
) A
WHERE A.DENSE_RNK =1
;

##########        APPLICATION OF LEAD, LAG        ##########################
-- Q)Give me YOY(Year-On-Year) Sales percentage for each employees
-- Note: Since we do not have data for 2016 , we'll get 0 in previous year columns(in left join). If you use inner join, 2017 rows will be ignored by mysql engine
-- General Method :
select a.Emp_Name,
         a.year as Current_year ,
         a.Sales as current_year_sales ,
         ifnull(b.year,0) as previous_year,
         ifnull(b.Sales,0) as previous_year_sales,
         ifnull(round(
                  100.0*((a.Sales -b.Sales)/b.Sales),
                  2),
               0) as YoY_Growth
from window_functions a
left join window_functions b
  ON a.Emp_Name=b.Emp_Name and a.Year=b.Year+1
;

--  Window_functions Method:
with cte as (
	SELECT  a.Emp_Name,
			a.year as Current_year ,
			a.Sales as current_year_sales ,
			LAG(Sales,1,0) over (partition by Emp_Name ORDER BY Year Asc) as previous_year_sales     #if null 0 is passed as 3rd parameter in lag(sales,1,0)
	FROM  window_functions a
)
SELECT emp_name,
       current_year,
       current_year_sales,
       previous_year_sales,
      ifnull( round(
            100.0*(current_year_sales-previous_year_sales)/previous_year_sales,
            2),
       0) as YoY_Growth
FROM cte