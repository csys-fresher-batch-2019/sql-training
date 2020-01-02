create table interviews( interview_date date, created_date timestamp default current_timestamp,
constraint interview_date_ck CHECK (  trunc(created_date) <= interview_date ) );



SQL> insert into interviews (interview_date) values (sysdate);

1 row created.

SQL> insert into interviews (interview_date) values (sysdate-1);
insert into interviews (interview_date) values (sysdate-1)
*
ERROR at line 1:
ORA-02290: check constraint (NARESH.INTERVIEW_DATE_CK) violated
