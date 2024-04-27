

## The Query :
```
   
SELECT 
    
    CURRENT_TIMESTAMP() AS current_date_time,
    CURRENT_DATE() AS current__date,
    
    EXTRACT(YEAR FROM CURRENT_TIMESTAMP()) AS year_of_today,
    EXTRACT(MONTH FROM CURRENT_TIMESTAMP()) AS month_of_today,
    EXTRACT(QUARTER FROM CURRENT_TIMESTAMP()) AS quarter_of_today,
    
    DATEDIFF('2023-12-03', '2023-11-19') AS date_diff_in_days,
    
    DATE_ADD(CURDATE(), INTERVAL 1 DAY) AS next_day,
    DATE_ADD(CURDATE(), INTERVAL 1 WEEK) AS next_week,
    DATE_ADD(CURDATE(), INTERVAL 1 MONTH) AS next_month,
    
    DATE_ADD(CURDATE(), INTERVAL -1 DAY) AS previous_day,
    DATE_ADD(CURDATE(), INTERVAL -1 WEEK) AS previous_week,
    DATE_ADD(CURDATE(), INTERVAL -1 MONTH) AS previous_month,
    
    DATE_FORMAT(CURDATE(), '%a: %D %b %Y') AS format_date1,
    DATE_FORMAT(CURDATE(), '%a: %h:%i %p') AS format_date2,
    DATE_FORMAT(CURDATE(), '%M-%Y') AS format_date3,
    
    DATE_ADD(CURRENT_DATE(), INTERVAL (- WEEKDAY(CURRENT_DATE())) DAY) AS first_day_of_week,
    DATE_FORMAT(NOW(), '%Y-%m-01') AS first_day_of_month,
    MAKEDATE(YEAR(NOW()), 1) AS first_day_of_year,
    MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 QUARTER as first_day_of_quarter

FROM DUAL -- this is required in some RDBMS such as Oracle


```

## The Result :

<html>
<body>
<table border=1>
<tr>
<td bgcolor=silver class='medium'>current_date_time</td>
<td bgcolor=silver class='medium'>current__date</td>
<td bgcolor=silver class='medium'>year_of_today</td>
<td bgcolor=silver class='medium'>month_of_today</td>
<td bgcolor=silver class='medium'>quarter_of_today</td>
<td bgcolor=silver class='medium'>date_diff_in_days</td>
<td bgcolor=silver class='medium'>next_day</td>
<td bgcolor=silver class='medium'>next_week</td>
<td bgcolor=silver class='medium'>next_month</td>
<td bgcolor=silver class='medium'>previous_day</td>
<td bgcolor=silver class='medium'>previous_week</td>
<td bgcolor=silver class='medium'>previous_month</td>
<td bgcolor=silver class='medium'>format_date1</td>
<td bgcolor=silver class='medium'>format_date2</td>
<td bgcolor=silver class='medium'>format_date3</td>
<td bgcolor=silver class='medium'>first_day_of_week</td>
<td bgcolor=silver class='medium'>first_day_of_month</td>
<td bgcolor=silver class='medium'>first_day_of_year</td>
<td bgcolor=silver class='medium'>first_day_of_quarter</td>
</tr>
<tr>
<td class='normal' valign='top'>2024-04-27 11:26:04</td>
<td class='normal' valign='top'>2024-04-27</td>
<td class='normal' valign='top'>2024</td>
<td class='normal' valign='top'>4</td>
<td class='normal' valign='top'>2</td>
<td class='normal' valign='top'>14</td>
<td class='normal' valign='top'>2024-04-28</td>
<td class='normal' valign='top'>2024-05-04</td>
<td class='normal' valign='top'>2024-05-27</td>
<td class='normal' valign='top'>2024-04-26</td>
<td class='normal' valign='top'>2024-04-20</td>
<td class='normal' valign='top'>2024-03-27</td>
<td class='normal' valign='top'>Sat: 27th Apr 2024</td>
<td class='normal' valign='top'>Sat: 12:00 AM</td>
<td class='normal' valign='top'>April-2024</td>
<td class='normal' valign='top'>2024-04-22</td>
<td class='normal' valign='top'>2024-04-01</td>
<td class='normal' valign='top'>2024-01-01</td>
<td class='normal' valign='top'>2024-04-01</td>
</tr>
</table>
</body>
</html>


![Pic of Date Function](https://github.com/Shafi-Shaik/MySQL/blob/master/MySQL%20Date%20Functions.png)

