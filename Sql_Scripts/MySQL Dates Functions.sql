# Mysql dates functions

SELECT ADDDATE('2022-02-22', INTERVAL 31 DAY);  # O/P:  2022-03-25

SELECT  current_date(),  CURDATE(), 
       current_time(), curtime(),
       current_timestamp(), now();
       
SELECT DATE('2003-12-31 01:02:03') as col; 
    
SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31') as col;  #-31 days

SELECT date_format('2010-11-30 23:59:59', '%a: %W : %b : %M : %D ') as col;
SELECT date_format('2010-11-30 23:59:59',' %d-%m-%Y  %h:%i:%s %p') as col;
   
SELECT STR_TO_DATE('01,5,2013','%d,%m,%Y');   
SELECT STR_TO_DATE('09:30:17a','%h:%i:%s');

 SELECT EXTRACT(HOUR_MICROSECOND FROM '2019-07-02 01:02:03'); # hours to till microsecond
 
 /*
 Allowed units to use in dateadd, extract functions
 time:      MICROSECOND,	SECOND,	MINUTE,	HOUR
 date:      DAY, WEEK,	MONTH,	QUARTER,	YEAR
 date-time: DAY_MICROSECOND,DAY_SECOND,DAY_MINUTE,DAY_HOUR,YEAR_MONTH,	SECOND_MICROSECOND,MINUTE_MICROSECOND,
			MINUTE_SECOND,HOUR_MICROSECOND,HOUR_SECOND,HOUR_MINUTE
 */