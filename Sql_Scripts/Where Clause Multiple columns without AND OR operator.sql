select * from gap_island
where row(product,user_id) 
      IN (select product,user_id from gap_island where product in ('Product3') or user_id in ('user1','user1'));

