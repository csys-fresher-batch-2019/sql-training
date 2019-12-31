#### Display Task Count 

```sql

DECLARE
v_tasks_count NUMBER;
BEGIN
select count(*) into v_tasks_count FROM tasks;
DBMSOUTPUT.put_line(v_tasks_count);
END;

```
