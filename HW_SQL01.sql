--01
SELECT * FROM Students
--02
SELECT Students.FirstName, Students.LastName FROM Students
--03
SELECT DISTINCT Students.FirstName FROM Students
--04
SELECT Students.FirstName FROM Students
WHERE Students.Age < 80
--05
SELECT * FROM Students
WHERE Students.Id = 1
--06
SELECT Students.id FROM Students
WHERE Students.FirstName like 'Ami' 
AND Students.LastName like 'Sason'
--07
SELECT * FROM Students
WHERE Students.FirstName IN ('Ami','Yael') AND  Students.Age > 20
--08
SELECT * FROM Students
WHERE Students.Age IS NULL
--09
SELECT * FROM Students
WHERE Students.Age IS NOT NULL
--10
SELECT Students.FirstName FROM Students
ORDER BY 1 ASC
--11
SELECT * FROM Students
ORDER BY Students.Age DESC
--12
SELECT TOP 2 * FROM Students
ORDER BY Students.Age DESC
--13
SELECT * FROM Students
WHERE Students.FirstName like 'A%' AND Students.Age > 20
ORDER BY Students.FirstName
--14
INSERT INTO Courses(CourseName)
VALUES ('Gaming')
--15
UPDATE Students
SET Students.age = 70
WHERE Students.Age > 80
--16
DELETE Students
WHERE Students.Id = 4
--17
SELECT CoursesStudents.CourseId
,Courses.CourseName
,CoursesStudents.StudentId
,Students.FirstName + ' ' + Students.LastName AS FullName
,CoursesStudents.Grade
FROM Students
INNER JOIN CoursesStudents ON CoursesStudents.StudentId = Students.Id
INNER JOIN Courses ON Courses.Id = CoursesStudents.CourseId
