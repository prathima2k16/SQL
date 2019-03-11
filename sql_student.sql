create table tbl_students
 (studentid int,
studentname varchar(60),
studentcity varchar(60),
studentDept varchar(60),
studentDOB varchar(60),
studentDOJ datetime,
studentstatus varchar(60),
studentmarks_10th int ,
studentmarks_12th int)

Select *from tbl_students

insert tbl_students values(101,'sruthi','bgl','cse','2/2/1990','6/1/2006','studing',70,80)
insert tbl_students values(102,'pavani','bgl','ece','5/2/1990','6/7/2007','studing',60,90)
insert tbl_students values(103,'john','hyd','cse','6/2/1996','5/3/2006','studing',76,70)
insert tbl_students values(104,'smith','chennai','ece','8/4/1991','6/16/2009','training',68,97)
insert tbl_students values(105,'john','Ongl','ece','12/22/1990','12/5/2004','studing',60,88)
insert tbl_students values(106,'sri','pune','cse','08/09/1991','11/01/2003','training',66,85)
insert tbl_students values(107,'jani','hyd','ece','10/22/1994','10/29/2009','training',78,68)
insert tbl_students values(108,'puja','bgl','ece','12/21/1990','11/08/2005','studing',70,80)
insert tbl_students values(109,'ABC','pune','ece','09/29/1998','6/4/2003','training',71,87)
insert tbl_students values(110,'dev','bgl','cse','1/1/1991','1/2/2002','studing',62,42)

--4. Create a List of students from 'BGL' City
select * from tbl_students where studentcity='bgl'

--5. Create a List of students whose 12th Marks is between 60 and 75
select * from tbl_students where studentmarks_12th between 60 and 70

--6. Create a List of students (StudentID , StudentName , StudentDOB, STudentStatus)
select studentid,studentname,studentDOB,studentstatus from tbl_students

--7. Create a List of students in the descending order based on the 12th marks and if the 
--marks is same then sort again as per the 10th marks descending order.

select * from tbl_students order by studentmarks_12th desc

--8. Retrieve the total numbers of students.
select count(*) from tbl_students

--9. Create a List of students who joined in Current Month.
insert tbl_students values(110,'Josh','bgl','ece','03/29/1998','3/4/2003','training',79,77)
select * from tbl_students where DATEDIFF(mm,studentdoj,GETDATE())=0;

--10. Create a List of students who joined 2 years ago.
select * from tbl_students where DATEDIFF(yy,studentDOJ,getdate())>2

--11. Create a List of students department names with no of students

select studentdept ,count(*) from tbl_students group by studentdept 

--12. Create a List of student cities with count of students

select studentcity ,count(*) from tbl_students group by studentcity

--13. Update some students city from Chennai to Pune
select * from tbl_students
update tbl_students set studentcity='pune' where studentid=104

select * from tbl_students
update tbl_students set studentcity='pune' where studentcity='chennai'

--14. Create a List of students department with avg of 12th mark where avg of 12th 
--mark is more than 50

select studentdept ,avg(studentmarks_12th),count(*) from tbl_students group by studentDept
having count(*) >50

--15. Create a Table tbl_Courses (StudentID , CourseName , Duration ) - Add Some records  

create table tbl_courses
(studentidd int ,
coursename varchar(20),
duration varchar(30)
)

select * from tbl_courses
insert tbl_courses values (1000,'prathima','40days')
insert tbl_courses values(1001,'yash','50days')
insert tbl_courses values(1002,'siri','60days')
insert tbl_courses values(1003,'krish','70days')


--16. Create a List of Students (StudentID , NoOfCourses).

select studentidd,coursename from tbl_courses

--17. Change the status of some students from Trainee to completed.

update tbl_students set studentstatus ='completed' where studentstatus='training'

Select *from tbl_students
--18. Create a List of Students who have joined in the current month.
select * from tbl_students where DATEDIFF(mm,studentdoj,GETDATE())=0;
























