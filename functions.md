# Book App

#### Table: BOOKS

| BOOK_ID | BOOK_NAME |
|---------|-----------|
| 101     | C         |
| 102     | Java      |


#### Table : BOOK_STOCK
| STOCK_ID | BOOK_ID | QUANTITY |
|----------|---------|----------|
| 1        | 101     | 100      |
| 2        | 102     | 50       |


#### Table : ORDERS
| ORDER_ID | USER_NAME | BOOK_ID | QUANTITY | STATUS    |
|----------|-----------|---------|----------|-----------|
| 1        | naresh    | 101     | 5        | ORDERED   |
| 2        | srini     | 101     | 3        | DELIVERED |
| 3        | prabhu    | 102     | 2        | ORDERED   |
| 4        | siva      | 101     | 1        | CANCELLED |


### Write a function to get the available stocks for the given book id

```sql
CREATE OR REPLACE FUNCTION FN_GET_BOOK_STOCK (  I_BOOK_ID IN NUMBER )
RETURN NUMBER AS 
-- DECLARATION
    v_remaining_stock NUMBER ;
    v_stock NUMBER ;
    v_ordered NUMBER;
BEGIN
   -- step 1: GEt stock count
   select quantity into v_stock from book_stock where book_id = i_book_id;
   DBMS_OUTPUT.put_line('Stock' || v_stock);
   
   --step 2: Get total books ordered
   select sum(quantity) into v_ordered from orders where 
   book_id = i.book_id and status IN( 'ORDERED', 'DELIVERED') ;
   DBMS_OUTPUT.put_line('Ordered Quantity' || v_ordered);
   
   --step 3: calculate remaining stock
   v_remaining_stock := v_stock - v_ordered;   
 -- step 4: return remaining stock
  RETURN v_remaining_stock;
END FN_GET_BOOK_STOCK;
```
