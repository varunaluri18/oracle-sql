select * from emp;
select * from employee natural join dept;
select ename,lpad('*',length(ename),'*')AS e from emp;
select mgr from emp;
select coalesce(mgr,0)from emp;
select
case 
when mgr IS NOT NULL then '0'
else'1'
end as NVL2
FROM emp;
select ename,
case
when deptno=10 then 'accounting'
when deptno=20 then 'reserch'
when deptno=30 then 'sales'
else 'unknown'
end as deparrment
from emp;
select * from hr.employees;
select * from hr.departments;
select ename,sal from employee10 where sal>100;
select ename,round(months,0)from employee10 order by employee10;
select * from tab;
desc emp;
desc dept;
select * from dept;
select ename from emp;
select ename,sal*12 from emp;
select eid,deptno from employee10;
select * from employee10;
select empno,deptno from employee10;
select ename,hiredate from employee10;
select ename,job from employee10;
select ename,sal*6 from employee10;
select ename,sal*12 from employee10;
select ename,sal+sal*0.25 from employee10;
select ename,sal-sal*0.12 from employee10;
select ename,sal+sal*0.18 from employee10;
select ename,sal-sal*0.40 from emp;
select ename,sal*12,sal+sal*0.07 from emp;
select ename,sal*12,sal+sal*0.34 from emp;
select ename,sal*12,sal+sal*5000 from emp;
select employee10.*,sal*12 from emp;
select esal*12 as annual salary from emp;
select distinct sal from emp;
select distinct job from emp;
select distinct deptno from emp;
select ename from emp where deptno=20;
select ename from emp where ename like 'dar\_a' escape '\';
select ename from emp where deptno=30;
select sal*12 from emp where ename='max';
select * from emp where sal>100;
select * from emp where hiredate>'01-jan-85';
select ename from emp where deptno=20 and sal>500;
select * from dept;
select * from emp where job='clerk' and sal<5500;
select ename,hiredate from emp where job='manager' and deptno=30;
select * from dept;
select ename,sal AS salary from employee1;
select ename,sal AS salary from employee1 order by sal;
select ename,sal AS salary from employee1 order by sal asc;
select ename,sal AS salary from employee1 order by 2 desc;
select floor((sysdate-hiredate)/365)from employee1 order by 1;
select sal+comm from employee1;
select sal||' '||comm from employee1;