SELECT ename,sal,deptno FROM EMPLOYEE10 WHERE deptno IN(20,30,40);
SELECT empno AS eno,ename AS name,job AS position,sal AS salary FROM employee10;
SELECT student_code,subject1,subject2,subject3,subject1+subject2+subject3 AS total_marks FROM student_marks;
select * from designation_master 
where design_name in('Professor','Leacturer');
SELECT staff_code,staff_name,dept_code FROM staff_masters 
WHERE(SELECT EXTRACT(year from sysdate)FROM dual)-EXTRACT(year from hire_date)>1;
SELECT staff_masters.staff_name,designation_master.design_name
FROM staff_masters JOIN designation_master ON (staff_masters.design_code=designation_master.design_code)
WHERE hire_date<='10-08-21';
select * from staff_masters;
select staff_masters.staff_name,designation_master.design_name,staff_masters.staff_sal*12*10 as income_for_10yrs
from staff_masters join designation_master on(staff_masters.design_code=designation_master.design_code)
where staff_masters.dept_code in(10,30);
select * from staff_masters;
select staff_name,designation_master.design_name,(select extract(year from sysdate)from dual)-extract(year from Hire_date) as experience 
from staff_masters join designation_master on (staff_masters.design_code=designation_master.design_code)
where designation_master.design_name='Leacturer';
SELECT CONCAT(CONCAT(student_name, ' , ' ),dept_code) AS student_info FROM student_masters;
SELECT staff_name,staff_sal from staff_masters where staff_sal BETWEEN 12000 AND 25000 ORDER BY staff_sal,staff_name;
SELECT * FROM staff_masters WHERE MGR_CODE IS NULL;
select * from  Staff_Masters;
VALUES (191,'darla',103,80,'12-jan-01','13-JUNE-1989','Bangalore',null,28000.56);
SELECT student_name,dept_code,student_dob FROM student_masters WHERE student_dob BETWEEN '1-jan-81' AND '31-mar-83' ORDER BY student_dob ASC;
SELECT dept_code,SUM(staff_sal)AS sum_of_salary FROM staff_masters WHERE mgr_code IS NOT NULL GROUP BY dept_code HAVING SUM(staff_sal)>20000;
SELECT * FROM book_transcations WHERE book_actual_return_date IS NULL AND book_expected_return_date='26-12-16';
SELECT * FROM Book_transactions;

INSERT INTO book_transcations VALUES (20,1010,182,'02-12-16','26-12-16',null);
select * from book_transcations;
select * from book_masters;
select * from student_masters;
select * from staff_masters;
SELECT student_name,NVL(TO_CHAR(dept_code),TO_CHAR('No Depatment'))AS department FROM student_masters;

SELECT student_name,TO_CHAR(student_dob,'month,dd yyyy') FROM student_masters 
WHERE(SELECT next_day(student_dob-7,'saturday')FROM DUAL)!=student_dob AND(SELECT next_day(student_dob-7,'sunday')FROM dual) !=student_dob;
select * from staff_masters;
select staff_name,round(MONTHS_BETWEEN(SYSDATE,hire_date))AS months_worked FROM staff_masters ORDER BY months_worke
SELECT * FROM employee10;
insert into employee10 values(7709,'ADAMS','PRESIDENT',7566,to_date('08-12-2021','dd-mm-yyyy'),2500,null,30);
insert into employee10 values(7710,'ADAMS','PRESIDENT',7839,to_date('09-02-2021','dd-mm-yyyy'),5500,null,30);
SELECT ename,job FROM employee10 WHERE(ename LIKE '_N%' OR ename LIKE '__N%') AND (ename LIKE '%N' OR ename LIKE '%S');
SELECT ename,LPAD(TO_CHAR(sal,'$0,00,00,000.00'),15,'$')FROM employee10;
SELECT ename FROM employee10 WHERE ename LIKE '%_%' ;
insert into employee10 values(7711,'DR_MAX','PRESIDENT',7566,to_date('11-02-2020','dd-mm-yyyy'),9500,null,10);
 SELECT * FROM employee10 WHERE hiredate LIKE '__-12-%'; 
 select * from employee10;
 SELECT staff_name,staff_sal,CASE WHEN staff_sal>=50000 THEN 'A' WHEN staff_sal BETWEEN 250000 AND 50000 THEN 'B' WHEN staff_sal BETWEEN 10000 AND 25000 THEN 'C' ELSE 'D' END AS grade FROM staff_masters;
 SELECT ename,hiredate,TO_CHAR(hiredate,'DAY') AS day FROM employee10 ORDER BY (next_day(hiredate,'monday')-hiredate)DESC; 
 SELECT RPAD('*',LENGTH(STAFF_NAME),'*')AS names from staff_masters;
 select CONCAT(RPAD(SUBSTR(staff_name,1,1),LENGTH(staff_name)-1,'*'),SUBSTR(staff_name,LENGTH(staff_name),LENGTH(staff_name))) AS names from staff_masters;
SELECT * FROM staff_masters WHERE TO_CHAR(hire_date,'dd')<=15;
SELECT ename,hiredate,TO_CHAR(hiredate,'day')from employee10 ORDER BY (next_day(hiredate,'monday')-hiredate) DESC;
SELECT INSTR('MISSISSIPPI','I',1,3) from dual;
SELECT ROUND(MAX(STAFF_SAL)) AS maximum,ROUND(MIN(STAFF_SAL)) AS MINIMUM,ROUND(SUM(staff_sal)) AS TOTAL,ROUND(AVG(staff_sal)) AS AVERAGE FROM staff_masters;
SELECT dept.dept_name,ROUND(MAX(staff.staff_sal)) AS maximum,ROUND(MIN(staff.staff_sal)) AS minimum,ROUND(SUM(staff.staff_sal)) AS total,ROUND(AVG(staff.staff_sal)) AS average
FROM staff_masters staff,department_masters dept 
where staff.dept_code=dept.dept_code GROUP BY dept.dept_name;
SELECT d.dept_code,d.dept_name,COUNT(s.staff_name) AS no_of_people FROM staff_masters S,department_masters d
WHERE s.dept_code=dept_code GROUP BY d.dept_code,d.dept_name;
CREATE VIEW mgrcode AS SELECT COUNT(mgr_code) AS total FROM staff_masters WHERE mgr_code IS NOT NULL GROUP BY mgr_code;
SELECT COUNT(total) AS total_no_of_managers FROM mgrcode;
CREATE VIEW min_sal AS SELECT mgr_code,MIN(staff_sal)AS min_salary FROM staff_masters where mgr_code IS NOT NULL GROUP BY mgr_code;
SELECT mis.mgr_code,staff.staff_name,mis.min_salary 
FROM min_sal mis JOIN staff_masters staff ON (mis.mgr_code=staff.staff_code)
where mis.min_salary>=20000 ORDER BY min_salary DESC;
SELECT * FROM staff_masters;
commit;