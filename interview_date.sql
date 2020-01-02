create table interviews( interview_date date, created_date timestamp default current_timestamp,
constraint interview_date_ck CHECK (  trunc(created_date) <= interview_date ) );
