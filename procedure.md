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
CREATE OR REPLACE PROCEDURE PR_ORDER_BOOK 
(
  I_BOOK_ID IN NUMBER 
, I_QTY IN NUMBER 
, I_USER_NAME IN VARCHAR2 
) AS 
V_BOOK_STOCK NUMBER;
BEGIN
   V_BOOK_STOCK := FN_GET_BOOK_STOCK ( I_BOOK_ID);
   IF V_BOOK_STOCK >= I_QTY THEN
    INSERT INTO ORDERS( ORDER_ID, USERNAME, BOOK_ID, QUANTITY, STATUS)
    VALUES ( ORDER_ID_SEQ.nextval, I_USER_NAME,I_BOOK_ID,I_QTY, 'ORDERED');
  END IF;
  COMMIT;
END PR_ORDER_BOOK;
```