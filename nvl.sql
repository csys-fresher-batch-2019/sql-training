select sum(quantity) as v_ordered from orders where 
   book_id = 101 and status IN( 'ORDERED', 'DELIVERED') ;
   
   select nvl(sum(quantity),0) as v_ordered from orders where 
   book_id = 101 and status IN( 'ORDERED', 'DELIVERED') ;
