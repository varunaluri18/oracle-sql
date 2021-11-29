create table student
(
rno number(5)	primary key,
name varchar(5)	not null,
m1 number(3)	check (m1 between 0 and 100), 
m2 number(3)	check (m2 between 0 and 100),
m3 number(3)	check (m3 between 0 and 100),
tpt number(5)	check (tpt between 0 and 300),
pct number(5)	check (pct between 0 and 100),
grade varchar(1) check (grade IN('D','F','S','T','F')),
res varchar(4)	check (result IN('PASS','FAIL')),
m_word varchar(50)
);

create or replace trigger t1 after insert on student
begin
update student
set	
tpt =m1+m2+m3, pct =(m1+m2+m3)/3, res = CASE WHEN (m1>=35 AND m2>=35 AND m3>=35) THEN 'PASS' ELSE 'FAIL' END,
grade =CASE	
WHEN m1>=35 AND m2>=35 AND m3>=35 AND (m1+m2+m3)/3 >=80 THEN 'D'
WHEN m1>=35 AND m2>=35 AND m3>=35 AND (m1+m2+m3)/3 >=60 AND (m1+m2+m3)<80 THEN 'F'
WHEN m1>=35 AND m2>=35 AND m3>=35 AND (m1+m2+m3)/3 >=50 AND (m1+m2+m3)<60 THEN 'S'
WHEN m1>=35 AND m2>=35 AND m3>=35 AND (m1+m2+m3)/3 >=35 AND (m1+m2+m3)<50 THEN 'T'
ELSE 'X' END;
end;
/

Alter trigger t1 disable
Alter trigger t1 enable
__________________________________________________________________________________
create or replace trigger t2 after insert on student
declare 
v_total		number;
v_percent	number;
v_result	varchar(4);
v_grade		varchar(4);
v_marks		varchar(50);
cursor c1 is select rno,m1,m2,m3 from student;
begin
for i in c1 loop

v_total :=i.m1+i.m2+i.m3;

v_percent :=v_total/3;

if i.m1 >=35 AND i.m2 >=35 AND i.m3 >=35 then
v.result ='PASS';
else 
v_result :='FAIL';
end if;

if v_result ='PASS' then
if v_percent>=80 then
v_grade := 'D';
elsif v_percent>=60 AND v_percent <80 then
v_grade :='F';
elsif v_percent>=50 AND v_percent <60 then
v_grade :='S';
elsif v_percent>=35 AND v_percent <50 then
v_grade :='T';
end if;
else 
v_grade :='X';
end if;

v_marks :=to_char(to_date(v_total,'J'),'JSP');

update student
set
tpt =v_total,
pct =v_percent,
grade =v_grade,
res =v_result,
m_word =v_marks
 
where rno =i.rno;
end loop
end;
/
__________________________________________________________________________________

create or replace procedure pt1
v_total		number;
v_percent	number;
v_result	varchar(4);
v_grade		varchar(4);
v_marks		varchar(50);
cursor c1 is select rno,m1,m2,m3 from student;
begin
for i in c1 loop

v_total :=i.m1+i.m2+i.m3;

v_percent :=v_total/3;

if i.m1 >=35 AND i.m2 >=35 AND i.m3 >=35 then
v.result ='PASS';
else 
v_result :='FAIL';
end if;

if v_result ='PASS' then
if v_percent>=80 then
v_grade := 'D';
elsif v_percent>=60 AND v_percent <80 then
v_grade :='F';
elsif v_percent>=50 AND v_percent <60 then
v_grade :='S';
elsif v_percent>=35 AND v_percent <50 then
v_grade :='T';
end if;
else 
v_grade :='X';
end if;

v_marks :=to_char(to_date(v_total,'J'),'JSP');

update student
set
tpt =v_total,
pct =v_percent,
grade =v_grade,
res =v_result,
m_word =v_marks
 
where rno =i.rno;
end loop
end tp1;
/

create or replace trigger t3 after insert on student
begin
tp1;
end t3;
/
__________________________________________________________________________________
Before Triggers:
create or replace trigger taa
before insert or delete or update on ta
for each row 
enable
declare
	v_user varchar2(10);
begin
	select user into v_user from dual;
	if inserting then
		dbms_output.put_line('Inserted by'|| v_user);
	elsif deleting then
		dbms_output.put_line('Deleted by'|| v_user);
	elsif updating then
		dbms_output.put_line('Updated by'|| v_user);
end if;
end;
/
