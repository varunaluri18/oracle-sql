***** Designation_Masters *****
create table Designation_Master(Design_code number(3) Not Null Primary Key,Design_name Varchar2(50));
INSERT INTO Designation_Master VALUES(101,'HOD');
INSERT INTO Designation_Master VALUES(102,'Professor');
INSERT INTO Designation_Master VALUES(103,'Reader');
INSERT INTO Designation_Master VALUES(104,'SR.Lecturer');
INSERT INTO Designation_Master VALUES(105,'Leacturer');
INSERT INTO Designation_Master VALUES(106,'Director');
INSERT INTO Designation_Master VALUES(107,'Principal');
INSERT INTO Designation_Master VALUES(108,'Coordinator');
INSERT INTO Designation_Master VALUES(109,'Counsellor');
INSERT INTO Designation_Master VALUES(110,'Sports-Trainer');
select * from Designation_Master;

***** Department_Masters *****
Create table Department_Masters(Dept_code number(2) Primary key,Dept_Name varchar2(50));
insert into department_masters values(10,'Computer_Science');
insert into department_masters values(20,'Electricals');
insert into department_masters values(30,'Electronics');
insert into department_masters values(40,'Mechanics');
insert into department_masters values(50,'Robotics');
insert into department_masters values(60,'Aeronautics');
insert into department_masters values(70,'Civil');
insert into department_masters values(80,'Management');
insert into department_masters values(90,'IT');
insert into department_masters values(99,'Arts');
select * from department_masters;

***** Student_masters *****
insert into student_masters values(1001,'Amit',10,'11-JAN-80','chennai');
insert into student_masters values(1002,'Ravi',20,'1-NOV-81','New-Delhi');
insert into student_masters values(1003,'Ajay',30,'13-JAN-82','null');
insert into student_masters values(1004,'Raj',40,'14-JAN-79','Mumbai');
insert into student_masters values(1005,'Arvind',50,'15-JAN-83','Banglore');
insert into student_masters values(1006,'Rahul',60,'16-JAN-78','Rajasthan');
insert into student_masters values(1007,'Mehul',70,'11-JAN-80','Chennai');
insert into student_masters values(1008,'Dev',80,'11-MAR-84','Banglore');
insert into student_masters values(1009,'Rajesh',90,'12-FEB-82','New-Delhi');
insert into student_masters values(1010,'Rajat',99,'18-FEB-79','Rajasthan');
select * from student_masters;   

***** book_masters *****
CREATE TABLE book_masters(book_code number(10) NOT NULL,book_name varchar2(50) NOT NULL,book_pub_year number,book_pub_author varchar2(50) NOT NULL);
INSERT INTO book_masters VALUES (10, 'Complete guide for machine learning',2014,'Leo Tolstoy');
INSERT INTO book_masters VALUES (20, 'Python Programming',2018,'Leo Tolstoy');
INSERT INTO book_masters VALUES (30, 'Clean code',2007,'Vladimir Nabokov');
INSERT INTO book_masters VALUES (40, 'Mathematics in computing',2010,'Fyodor Dostoevsky');
INSERT INTO book_masters VALUES (50, 'Complete code',2011,'William Faulkner');
INSERT INTO book_masters VALUES (60, 'Head first SQL',2013,'Charles Dickens');
INSERT INTO book_masters VALUES (70, 'SQL Cookbook',2016,'Anton Checkhov ');
INSERT INTO book_masters VALUES (80, 'SQL Practice Problems',2008,'Gustave Flaubert');
INSERT INTO book_masters VALUES (90, 'Oracle  PL/SQL Programming',2010,'Jane Austen');
INSERT INTO book_masters VALUES (100, 'Data analysis using SQL',2014,'Charles');
SELECT * FROM book_masters;

***** Book_transcations *****
CREATE TABLE Book_transcations(Book_code number,Student_code number,Staff_code number,Book_issue_date date NOT NULL,Book_expected_return_date DATE NOT NULL,Book_actual_retrun_date DATE);

INSERT INTO book_transcations VALUES (10,1001,181,to_date('18-06-79','dd-mm-yyyy'),to_date('18-09-79','dd-mm-yyyy'),to_date('13-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (20,1002,182,to_date('05-06-2021','dd-mm-yyyy'),to_date('19-06-2021','dd-mm-yyyy'),to_date('24-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (30,1003,183,to_date('27-05-2021','dd-mm-yyyy'),to_date('10-06-2021','dd-mm-yyyy'),to_date('18-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (40,1004,184,to_date('08-06-2021','dd-mm-yyyy'),to_date('22-06-2021','dd-mm-yyyy'),to_date('23-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (50,1003,185,to_date('01-06-2021','dd-mm-yyyy'),to_date('15-06-2021','dd-mm-yyyy'),to_date('25-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (60,1002,186,to_date('27-05-2021','dd-mm-yyyy'),to_date('10-06-2021','dd-mm-yyyy'),to_date('09-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (70,1006,187,to_date('11-06-2021','dd-mm-yyyy'),to_date('25-06-2021','dd-mm-yyyy'),to_date('04-07-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (80,1007,188,to_date('12-06-2021','dd-mm-yyyy'),to_date('26-06-2021','dd-mm-yyyy'),to_date('26-06-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (90,1008,189,to_date('01-07-2021','dd-mm-yyyy'),to_date('15-07-2021','dd-mm-yyyy'),to_date('15-07-2021','dd-mm-yyyy'));
INSERT INTO book_transcations VALUES (100,1009,190,to_date('04-06-2021','dd-mm-yyyy'),to_date('18-06-2021','dd-mm-yyyy'),to_date('19-06-2021','dd-mm-yyyy'));

***** stafff_masters *****

CREATE TABLE stafff_masters(staff_code number(8) NOT NULL,staff_name varchar2(50) NOT NULL,design_code number,dept_code number,hire_date date,staff_DOB date,staff_address varchar2(240),mgr_code number(8),staff_sal number(10,2));

insert into stafff_masters values(181,'BLAKE',101,10,to_date('03-04-2018','dd-mm-yyyy'),to_date('08-04-1995','dd-mm-yyyy'),'CHICAGO',543895,25000);
insert into stafff_masters values(182,'CLARK',102,10,to_date('12-10-2018','dd-mm-yyyy'),to_date('02-10-1994','dd-mm-yyyy'),'NEWYORK',578240,31000);
insert into stafff_masters values(183,'JOY',103,10,to_date('09-03-2019','dd-mm-yyyy'),to_date('14-12-1998','dd-mm-yyyy'),'NEWJERSY',893461,38000);
insert into stafff_masters values(184,'RAJ',104,30,to_date('07-09-2017','dd-mm-yyyy'),to_date('04-12-1996','dd-mm-yyyy'),'BELGIUM',978061,32000);
insert into stafff_masters values(185,'ASH',105,20,to_date('17-06-2018','dd-mm-yyyy'),to_date('14-02-1994','dd-mm-yyyy'),'PORTIGUAL',653872,27500);
insert into stafff_masters values(186,'SAM',106,30,to_date('18-09-2019','dd-mm-yyyy'),to_date('07-03-1994','dd-mm-yyyy'),'FRANCE',352890,28000);
insert into stafff_masters values(187,'JAI',107,40,to_date('01-12-2019','dd-mm-yyyy'),to_date('28-03-1999','dd-mm-yyyy'),'FRANCE',235984,32000);
insert into stafff_masters values(188,'STEVEN',108,30,to_date('01-11-2019','dd-mm-yyyy'),to_date('18-07-1996','dd-mm-yyyy'),'GERMANY',576884,29500);
insert into stafff_masters values(189,'HASTIN',109,20,to_date('09-11-2017','dd-mm-yyyy'),to_date('08-12-1994','dd-mm-yyyy'),'FRANCE',678434,31500);
insert into stafff_masters values(190,'WADE',110,40,to_date('19-01-2020','dd-mm-yyyy'),to_date('23-12-1998','dd-mm-yyyy'),'NEWJERSY',634238,26700);

***** student_marks *****
create table student_marks (student_code number(6),student_year number not null,sub1 number(3),sub2 number(3),sub3 number(3));
Insert into student_marks values (1001,2010,65,78,98);
Insert into student_marks values (1002,2011,76,98,45);
Insert into student_marks values (1003,2011,76,90,89);
Insert into student_marks values (1004,2020,87,67,65);
Insert into student_marks values (1005,2021,90,89,78);
Insert into student_marks values (1006,2010,56,76,87);
Insert into student_marks values (1007,2003,45,09,78);
Insert into student_marks values (1008,2004,99,56,50);
Insert into student_marks values (1009,2005,46,09,77);
Insert into student_marks values (1010,2006,76,48,98);
Insert into student_marks values (1011,2007,67,89,99);
Insert into student_marks values (1012,2008,67,87,56);
Insert into student_marks values (1013,2009,76,54,87);
Insert into student_marks values (1014,2010,87,55,98);
Insert into student_marks values (1015,2020,76,54,43);
