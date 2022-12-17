use data_engineer;
/* table names: customers,	geolocation, orders, order_items,order_payments,
                order_reviews, products, sellers, product_category */

#  $$$$$$$$$$ 1. Total order count with revenue for each states?  $$$$$$$$$$

select c.customer_state,
       count(o.order_id) as orders,
       sum(op.payment_value) as revenue																	
from orders o
inner join customers c
 on o.customer_id=c.customer_id
inner join  order_payments op
 on o.order_id=op.order_id
group by 1
order by 2 desc
LIMIT 5;

#  $$$$$$$$$$ 2. Total order count with revenue for each states where review_score of order is 5?  $$$$$$$$$$

select c.customer_state,
       count(o.order_id) as orders,
       sum(op.payment_value) as revenue																	
from orders o
inner join customers c
 on o.customer_id=c.customer_id
inner join  order_payments op
 on o.order_id=op.order_id
inner join order_reviews r
 on o.order_id=r.order_id
WHERE r.review_score = 5
group by 1
order by 2 desc
LIMIT 5;


#  $$$$$$$$$$ 3. Total order count made by each seller where payment mode was "debit_card"?  $$$$$$$$$$

select s.seller_id,
       count(o.order_id) as orders,
       sum(op.payment_value) as revenue																	
from orders o
inner join  order_payments op
 on o.order_id=op.order_id
inner join order_items oi
 on o.order_id=oi.order_id
 inner join sellers s
 on oi.seller_id=s.seller_id
WHERE op.payment_type='Debit_card'
group by 1
order by 2 desc
LIMIT 5;

#  $$$$$$$$$$  4. Top 5 english name of products with maximum selling price? $$$$$$$$$$
select pp.product_category_name_english,
       count(o.order_id) as orders,
       max(o.price) as max_price																	
from products p
inner join  order_items o
 on o.product_id=p.product_id
inner join product_category pp
 on p.product_category_name=pp.product_category_name
group by 1
order by 3 desc
LIMIT 5;

              -- Another Way
select product_category_name_english, price
from (
select product_category_name_english,p.product_id,
            price,
            rank() over(partition by pp.product_category_name order by oi.price desc) as rn

from products p
inner join order_items oi 
 on oi.product_id=p.product_id
inner join product_category pp
 on p.product_category_name=pp.product_category_name
) a
where rn =1
order by 2 desc
limit 5;


#  $$$$$$$$$$  5. Year (order_items.shipping_limit_date) with maximum order ordered? $$$$$$$$$$
select extract(year
                from str_to_date(shipping_limit_date,'%Y-%m-%d %H:%i:%s')
              ) as year,
       count(o.order_id) as orders															
from order_items o
group by 1