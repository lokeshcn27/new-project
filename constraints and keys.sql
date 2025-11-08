use etl;
create table emp43(id int,fname varchar(30),lname varchar(30),gender varchar(20),salary int);
insert into emp43 values(1,'Luv','Sharma','M',80),
(2,'Lata','Verma','F',90),
(3,'Prem','Gupta','M',85),
(4,'Priya','Joshi','F',95),
(5,'Satish','Patil','M',75),
(6,'Savitri','Patel','F',65),
(7,'Raghu','Sharma','M',55),
(8,'Rajni','Kamble','F',50),
(9,'Tanmay','Sharma','M',60),
(10,'Taniya','Joshi','F',70);
select * from emp43;
# show the repeated lnames
select lname,count(lname) from emp43
group by lname having count(lname)>1;
# show the most repeated lname
select lname,count(lname) from emp43
group by lname order by count(lname) desc limit 1;
# show unique locations in data
select distinct location from emp43;
# how many null values are there in salary column
select count(*) from emp43 where salary is null;
# constraints >> set of rules applied on columns
# not null >> cannot leave blank
# unique >> cannot insert repeated value 
# default >> it takes default value if any value is not inserted
# check >> it checks the condition and then insert the value 
# auto_increment >> it enters a value by adding 1 on previous value 

create table emp56(id int unique not null,name varchar(50),
age int check(age>=18),gender varchar(40) default 'M');
select * from emp56;

insert into emp56(id,name,age)
values(1,'jay',40);
select * from emp56;

insert into emp56(id,name,age)
values(2,'jaya',23);

select * from emp56;

insert into emp56(id,name,age,gender)
values(3,'gayatri',19,'f');

select * from emp56;

alter table emp56 modify column id int unique not null auto_increment;

insert into emp56(name,age)
values('raj',20);

insert into emp56(name,age,gender)
values('rani',30,'f');

select * from emp56;
# keys
# it is used to establish relation between 2 tables
# to maintain intigrity of data
# primary key >> parent table , only 1 primary key in 1 table 
# foriegn key >> child table , multiple foriegn keys can be applied

create table student(roll_no int primary key,fname varchar(20),lname varchar(20)); 

create table course(crs_id int,course_name varchar(30),roll_no int,
                    foreign key(roll_no) references student(roll_no)); 
                    
# add in parent then in child
insert into course
values(1,'da',1);  # this query should give error

insert into student
values(1,'dev','singh');

insert into course
values(1,'da',1);

# remove from child then from parent
delete from student where roll_no=1;

delete from course where roll_no=1;

delete from student where roll_no=1;




























