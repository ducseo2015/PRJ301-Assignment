Select slotId,slotNumber,startTime,endTime from TimeSlot;

Select instructorId,instructorName from Instructor

Select roomId from Room

Select courseId,courseName from Course


--Group
Select g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName
From [Group] g inner join Instructor i on g.instructorId=i.instructorId
inner join Course c on g.courseId=c.courseId
where i.instructorId= ?
--Session
SET DATEFORMAT dmy;
Select s.sessionId,s.sessionName,s.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId
From [Session] s inner join Instructor i on s.lecturerId=i.instructorId
inner join TimeSlot t on s.slotId=t.slotId
inner join Room r on s.roomId=r.roomId
inner join [Group] g on s.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
where i.instructorId='sonnt5' and s.[date] = '2023-03-02'

Select s.sessionId,s.sessionName,s.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId
From [Session] s inner join Instructor i on s.lecturerId=i.instructorId
inner join TimeSlot t on s.slotId=t.slotId
inner join Room r on s.roomId=r.roomId
inner join [Group] g on s.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
where i.instructorId='sonnt5' and c.courseId='PRJ301'

--Participate
Select p.groupId,p.studentId,s.studentImage,s.studentName,g.courseId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName from Participate p inner join Student s on p.studentId=s.studentId
inner join [Group] g on p.groupId=g.groupId
inner join Instructor i on g.instructorId=i.instructorId
inner join Course c on g.courseId=c.courseId
where groupName='SE1723' and i.instructorId='sonnt5' and c.courseId='PRJ301'

Select studentId,studentName,studentImage from Student

--Attend
Select a.studentId,a.sessionId,a.[status],a.recordTime,a.comment,s.studentName,s.studentImage,se.sessionName,se.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId From Attend a inner join Student s on a.studentId=s.studentId
inner join [Session] se on a.sessionId=se.sessionId
inner join Instructor i on se.lecturerId=i.instructorId
inner join TimeSlot t on se.slotId=t.slotId
inner join Room r on se.roomId=r.roomId
inner join [Group] g on se.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
where groupName='SE1723' and c.courseId ='PRJ301' and se.lecturerId='sonnt5'

Select * from Attend
Insert into Attend(studentId,sessionId,[status],recordTime,comment) values (?,?,?,?,?)
--Group
Select g.instructorId,g. from [Group] g
inner join Instructor i on g.instructorId=i.instructorId

Select * from Attend

Select * from [group]

Insert into AttendTest values 