Create or replace procedure cp01 is
	v_sal number;
Begin
	select sal into v_sal from emp where sal = 800;
	Dbms_output.put_line(‘v_sal :’||v_sal);
End;
/
Exec cp01
Create or replace procedure cp02 is
	v_empno number;
	v_ename varchar2(10);
	v_sal number;
	v_comm number;
begin
	select empno,ename,sal,NVL(comm,0)
	into v_empno,v_ename,v_sal,v_comm
	from emp where sal = 1000;
	dbms_output.put_line(‘emp :’||v_empno||’:’||v_ename||’:’||v_sal||’:’||v_comm);
end;
/
Exec cp02
Create or replace procedure cp03 is
	Cursor c1 is select sal from emp where sal >=2500
	v_sal emp.sal % TYPE;
begin
	open c1;
		loop
			fetch c1 into v_sal;
			exit when c1 % notfound;
			dbms_output.put_line(‘v_sal :’||v_sal);
		end loop;
	close c1;
end;
/
Exec cp03
//Fetch multiple records of multiple columns into pl/sql block using cursor
Create or replace procedure cpo4 is
	Cursor c1 is select empno,ename,sal from emp where sal >=2500;
	v_no 	emp.empno 	%TYPE;
	v_ename 	emp.ename 	%TYPE;
	v_sal 		emp.sal 	%TYPE;
begin
	open c1;
		loop
			fetch c1 into v_no, v_ename ,v_sal;
			exit when c1 is % NOTFOUND;
			dbms_output.put_line(‘emp :’||v_no||’:’||v_ename||’:’||v_sal);
		end loop;
	close c1;
end;
/
Exec cp04
//Fetch multiple records of multiple columns into pl/sql block using cursor variable
create or replace procedure cp05 is
 cursor c1 is select ename from emp where deptno=10;
 c emp%ROWTYPE;
 begin
      open c1;
              loop
                      fetch c1 into c.ename;
                      exit when c1%NOTFOUND;
                      dbms_output.put_line(c.ename);
              end loop;
      close c1;
   end;
   /
Exec cp05



create or replace procedure cp06 is
cursor c2 is select ename,sal,hiredate from emp where deptno=20;
v_c emp%ROWTYPE;
begin
     open c2;
             loop
                     fetch c2 into v_c.ename,v_c.sal,v_c.hiredate;
                     exit when c2%NOTFOUND;
                     dbms_output.put_line(v_c.ename||':'||v_c.sal||':'||v_c.hiredate);
             end loop;
      close c2;
   end;
   /
EXEC cp06
create or replace procedure cp07 is
 cursor c3 is select * from emp;
  v_c3 emp%ROWTYPE;
 begin
 open c3;
 loop
 fetch c3 into v_c3;
 exit when c3 %NOTFOUND;
dbms_output.put_line(v_c3.ename ||’:	’||v_c3.deptno||’:’|| v_c3.sal||’:’||v_c3.job||’:’||v_c3.hiredate);
 end loop;
 close c3;
 end;
 /
EXEC cp07
SHO ERR


create or replace procedure cp08 is
cursor c4 is select * from dept;
v_c4 c4 %ROWTYPE;
begin
open c4;
loop	
fetch c4 into v_c4;
exit when c4 %NOTFOUND;
dbms_output.put_line(v_c4.dname||v_c4.loc);
end loop;
close c4;

open c4;
loop
fetch c4 into v_c4;
exit when c4 %NOTFOUND;
dbms_output.put_line(v_c4.dname||v_c4.loc);
end loop;
close c4;
end;
/
Exec cp08
Sho err
create or replace procedure cp09 is
cursor c5 is select empno ,ename ,sal from emp where sal <=1100;
begin
for i in c5
loop
dbms_output.put_line(i.empno||i.ename||i.sal);
end loop;
end;
/

create or replace procedure cp09 is
cursor c5 is select * from emp;
begin
for i in c5
loop
dbms_output.put_line(i.empno||':'||i.ename||':'||i.sal);
end loop;
end;
/
Exec cp09
Implementing 2 cursors:::
Create or replace procedure cp1 is
Cursor c1 is select empno ,sal from emp where deptno =10;
Cursor c2  is select empno ,sal from emp where deptno =20;
v_c1 emp%ROWTYPE;
v_c2 emp%ROWTYPE;
begin
open c1;
loop
fetch c1 into v_c1;
exit when c1%NOTFOUND;
dbms_output.put_line(empno||sal);
end loop
close c1;

open c2;
loop
fetch c2 into v_c2;
exit when c2%NOTFOUND;
dbms_output.put_line(empno||sal);
end loop
close c2;
end;
/
EXEC cp10
Using for loop 
create or replace procedure cp11 is
cursor c1 is select empno,ename,sal from emp where sal <=1100;
begin
for i in c1 loop
dbms_output.put_line(i.empno||’:’||i.ename||’:’||i.sal);
end loop;
end;
/
Exec cp11
create or replace procedure cp12 is
cursor c1 is select * from emp;
begin
for i in c1 loop
dbms_output.put_line(i.empno||’:’||i.ename||’:’||i.sal);
end loop;
end;
/
Cursor FOR loop
Create or replace procedure cp13 is
Cursor c1 is select empno ,sal from emp where deptno =10;
Cursor c2 is select empno ,sal from emp where deptno =20;
Begin 
For i in c1 loop
Dbms_output.put_line(i.empno||i.sal);
End loop;

For j in c2 loop
Dbms_output.put_line(j.empno||j.sal);
End loop;
End;
/
Exec cp13
_________________________________________________________________________

Parameterized cursor --- only IN parameters
Create or replace cursor cp14 is
Cursor c1 (v1 number) is select empno ,sal from emp where deptno =v1;
V_c1 c1%ROWTYPE
Begin
Open c1(10);
Loop
Fetch c1 into v_c1;
Exit when c1 % NOTFOUND;
Dbms_output.put_line(v_c1.empno,v_c1.sal);
End loop;
Close c1;

Open c1(20);
Loop
Fetch c1 into v_c1;
Exit when c1 % NOTFOUND;
Dbms_output.put_line(v_c1.empno,v_c1.sal);
End loop;
Close c1;
End;
/
Exec cp14
_________________________________________________________________________________
Cursor for loop
Create or replace procedure cp15 is
Cursor c1 (v1 Number) is select empno,sal from emp where deptno =v1;
Begin
For i in c1(10) loop
Dbms_output.put_line(i.empno||i.sal);
End loop;

For j in c1(10) loop
Dbms_output.put_line(j.empno||j.sal);
End loop;
End;
/
Exec cp15 
__________________________________________________________________________________
create or replace procedure cp016 is
cursor c1 is select * from emp join dept on emp.deptno=dept.deptno;
begin
for i in c1 loop
dbms_output.put_line(i.empno||’:’||i.ename||’:’||i.sal||':'||i.loc||':'||i.dname);
end loop;
end;
/
Exec cp16
