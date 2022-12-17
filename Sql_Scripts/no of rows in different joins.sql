create temporary table t1 as (
select 'A' as x
union all
select 'A' as x

);
create temporary table t2 as (
select 'A' as y
union all
select 'A' as y
);

#inner join
select * from t1
inner join t2
 on t1.x=t2.y ;


#left join
select * from t1
left join t2
 on t1.x=t2.y;
 
 
#right join

select * from t1
right join t2
 on t1.x=t2.y;
 
 
#cross join
select * from t1
cross join t2 ;

#full join
select * from t1
full join t2 ;



/* to import csv into mysql DATABASE



LOAD DATA INFILE 'S:/Datasets/DE/data/olist_order_items_dataset.csv' 
INTO TABLE order_items 
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
*/