create table student(usn varchar(10) primary key,name varchar(20),address 
varchar(20),phone double,gender varchar(5));

 create table semsec(ssid int(5) primary key,sem int(5),sec varchar(5));

  create table class(usn varchar(10) primary key,ssid int(5),foreign key(usn) references 
student(usn) on delete cascade,foreign key(ssid) references semsec(ssid));

create table subject(sub_code varchar(10) primary key,title varchar(10),sem int(5),credits 
int(5));

 create table IA_marks1(usn varchar(10),sub_code varchar(10),ssid int(5),test1 int,test2 
int,test3 int,final_IA int,primary key(usn,sub_code,ssid),foreign key(usn) references 
student(usn),foreign key(sub_code) references subject(sub_code),foreign key(ssid) references 
semsec(ssid));

insert into student values('1GD16CS001','akanksha','bangalore',9090786756,'F');
insert into student values('1GD16CS002','rohit','pune',9090786766,'M');
insert into student values('1GD16CS003','kirti','delhi',8890786766,'F');
insert into student values('1GD16CS004','tarun','bangalore',8890786796,'M');

 insert into semsec values(01,4,'C');
insert into semsec values(02,7,'A');
insert into semsec values(03,1,'B');
 insert into semsec values(04,4,'C');

insert into class values('1GD16CS001',04);
insert into class values('1GD16CS002',01);
insert into class values('1GD16CS003',02);
insert into class values('1GD16CS004',03);

insert into subject values('15CS32','DS',3,4);
insert into subject values('15CS33','DBMS',5,4);
insert into subject values('15CS34','CO',7,3);
insert into subject values('15CS13','PCD',1,5);

insert into IA_marks1 values('1GD16CS001','15CS13',01,25,15,20,22);
insert into IA_marks1 values('1GD16CS002','15CS34',02,12,14,16,15);
insert into IA_marks1 values('1GD16CS003','15CS33',03,18,19,14,16);
insert into IA_marks1 values('1GD16CS004','15CS32',04,10,9,8,9);
insert into IA_marks1 values('1GD16CS001','15CS33',01,30,18,10,25);
insert into IA_marks1 values('1GD16CS001','15CS34',01,30,18,10,30);

 select * from student;
+------------+----------+-----------+------------+--------+
| usn | name | address | phone | gender |
+------------+----------+-----------+------------+--------+
| 1GD16CS001 | akanksha | bangalore | 9090786756 | F |
| 1GD16CS002 | rohit | pune | 9090786766 | M |
| 1GD16CS003 | kirti | delhi | 8890786766 | F |
| 1GD16CS004 | tarun | bangalore | 8890786796 | M |
+------------+----------+-----------+------------+--------+
select * from semsec;
+------+------+------+
| ssid | sem | sec |
+------+------+------+
| 1 | 4 | C |
| 2 | 7 | A |
| 3 | 1 | B |
| 4 | 4 | C |
+------+------+------+
select * from class;
+------------+------+
| usn | ssid |
+------------+------+
| 1GD16CS002 | 1 |
| 1GD16CS003 | 2 |
| 1GD16CS004 | 3 |
| 1GD16CS001 | 4 |
+------------+------+
 select * from subject;
+----------+-------+------+---------+
| sub_code | title | sem | credits |
+----------+-------+------+---------+
| 15CS13 | PCD | 1 | 5 |
| 15CS32 | DS | 3 | 4 |
| 15CS33 | DBMS | 5 | 4 |
| 15CS34 | CO | 7 | 3 |
+----------+-------+------+---------+
 select * from IA_marks1;
+------------+----------+------+-------+-------+-------+----------+
| usn | sub_code | ssid | test1 | test2 | test3 | final_IA |
+------------+----------+------+-------+-------+-------+----------+
| 1GD16CS001 | 15CS13 | 1 | 25 | 15 | 20 | 22 |
| 1GD16CS001 | 15CS33 | 1 | 30 | 18 | 10 | 25 |
| 1GD16CS001 | 15CS34 | 1 | 30 | 18 | 10 | 30 |
| 1GD16CS002 | 15CS34 | 2 | 12 | 14 | 16 | 15 |
| 1GD16CS003 | 15CS33 | 3 | 18 | 19 | 14 | 16 |
| 1GD16CS004 | 15CS32 | 4 | 10 | 9 | 8 | 9 |
+------------+----------+------+-------+-------+-------+----------+

QUERY1: List all the student details studying in fourth semester ‘C’ section.
 select s.* from student s,semsec ss,class c where s.usn=c.usn and ss.ssid=c.ssid and 
ss.sem=4 and ss.sec='C';
+------------+----------+-----------+------------+--------+
| usn | name | address | phone | gender |
+------------+----------+-----------+------------+--------+
| 1GD16CS002 | rohit | pune | 9090786766 | M |
| 1GD16CS001 | akanksha | bangalore | 9090786756 | F |
+------------+----------+-----------+------------+--------+

QUERY 2: Compute the total number of male and female students in each semester and each 
section.
 select sem,sec,gender ,count(gender) from student natural join class natural join semsec 
group by sem,sec,gender;
+------+------+--------+---------------+
| sem | sec | gender | count(gender) |
+------+------+--------+---------------+
| 1 | B | M | 1 |
| 4 | C | F | 1 |
| 4 | C | M | 1 |
| 7 | A | F | 1 |
+------+------+--------+---------------+
 insert into student values('1GD16CS005','akash','bangalore',9870786756,'M');
 insert into class values('1GD16CS005',01);
 select sem,sec,gender ,count(gender) from student natural join class natural join semsec 
group by sem,sec,gender;
+------+------+--------+---------------+
| sem | sec | gender | count(gender) |
+------+------+--------+---------------+
| 1 | B | M | 1 |
| 4 | C | F | 1 |
| 4 | C | M | 2 |
| 7 | A | F | 1 |
+------+------+--------+---------------+ 
QUERY 3: Create a view of Test1 marks of student USN ‘1GD16CS001’ in all subjects
 create view testmrk as select usn,sub_code,test1 from IA_marks1 where 
usn='1GD16CS001';
 select * from testmrk;
+------------+----------+-------+
| usn | sub_code | test1 |
+------------+----------+-------+
| 1GD16CS001 | 15CS13 | 25 |
| 1GD16CS001 | 15CS33 | 30 |
| 1GD16CS001 | 15CS34 | 30 |
+------------+----------+-------+

QUERY4: Calculate the FinalIA (average of best two test marks) and update the
 corresponding table for all students.
update IA_marks1 set final_IA =(test1+test2+test3-least(test1,test2,test3))/2;
 select * from IA_marks1;
+------------+----------+------+-------+-------+-------+----------+
| usn | sub_code | ssid | test1 | test2 | test3 | final_IA |
+------------+----------+------+-------+-------+-------+----------+
| 1GD16CS001 | 15CS13 | 1 | 25 | 15 | 20 | 23 |
| 1GD16CS001 | 15CS33 | 1 | 30 | 18 | 10 | 24 |
| 1GD16CS001 | 15CS34 | 1 | 30 | 18 | 10 | 24 |
| 1GD16CS002 | 15CS34 | 2 | 12 | 14 | 16 | 15 |
| 1GD16CS003 | 15CS33 | 3 | 18 | 19 | 14 | 19 |
| 1GD16CS004 | 15CS32 | 4 | 10 | 9 | 8 | 10 |
+------------+----------+------+-------+-------+-------+----------+

QUERY5: Categorize students based on the following criterion:
 If FinalIA = 17 to 20 then CAT = ‘Outstanding’
 If FinalIA = 12 to 16 then CAT = ‘Average’
 If FinalIA< 12 then CAT = ‘Weak’
 Give these details only for 8th semester A, B, and C section students.
 select s.usn,s.name,i.final_IA,(case when i.final_IA between 17 and 30 then 'outstanding' 
when i.final_IA between 12 and 16 then 'average' else 'weak' end) as cat from student s,semsec 
ss,IA_marks1 i,subject b where s.usn=i.usn and ss.ssid=i.ssid and b.sub_code = i.sub_code and 
ss.sem=7;
+------------+-------+----------+---------+
| usn | name | final_IA | cat |
+------------+-------+----------+---------+
| 1GD16CS002 | rohit | 15 | average |
+------------+-------+----------+---------+
CONCLUSION: Tables are created and the values have been inserted accordingly and all the 
mentioned queries have been executed
