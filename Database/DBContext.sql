Select slotId,slotNumber,startTime,endTime from TimeSlot;

Select instructorId,instructorName from Instructor

Select roomId from Room

Select courseId,courseName from Course

Select * from Student

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

Select s.sessionId,s.sessionName,s.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId,iif(a.[status] IS NULL ,'false','true') as [status]
From [Session] s inner join Instructor i on s.lecturerId=i.instructorId
inner join TimeSlot t on s.slotId=t.slotId
inner join Room r on s.roomId=r.roomId
inner join [Group] g on s.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
inner join Participate p on p.groupId=g.groupId
inner join Student su on p.studentId=su.studentId
left join Attend a on a.sessionId=s.sessionId
where su.studentId='HE170996' and s.[date] between '2023-03-06' and '2023-03-12'

Select distinct s.sessionId,s.sessionName,s.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId,iif(a.[status] IS NULL ,'false','true') as [status]
From [Session] s inner join Instructor i on s.lecturerId=i.instructorId
inner join TimeSlot t on s.slotId=t.slotId
inner join Room r on s.roomId=r.roomId
inner join [Group] g on s.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
inner join Participate p on p.groupId=g.groupId
left join Attend a on a.sessionId=s.sessionId
where i.instructorId='sonnt5' and s.[date] between '2023-03-06' and '2023-03-12'

Select s.sessionId,s.sessionName,s.[date] from [Session] s

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
Select a.studentId,a.sessionId,a.[status],a.recordTime,a.comment,s.studentName,s.studentImage,se.sessionName,se.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId,count(a.status) as [absent] From Attend a inner join Student s on a.studentId=s.studentId
inner join [Session] se on a.sessionId=se.sessionId
inner join Instructor i on se.lecturerId=i.instructorId
inner join TimeSlot t on se.slotId=t.slotId
inner join Room r on se.roomId=r.roomId
inner join [Group] g on se.groupId=g.groupId
inner join Course c on g.courseId=c.courseId
inner join Student su on a.studentId=su.studentId
where groupName='SE1723' and c.courseId ='PRJ301' and se.lecturerId='sonnt5' and  a.status=0
Group by a.sessionId,a.studentId,a.[status],a.recordTime,a.comment,s.studentName,s.studentImage,se.sessionName,se.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId
--Upadte Attendane
Update Attend set [status] = 1 ,comment = 'hihi', recordTime = '2023-01-07 15:40:00.000' where studentId = 'HE130464' and sessionId = '109'Update Attend set [status] = 1 ,comment = 'hihi', recordTime = '2023-01-07 15:40:00.000' where studentId = 'HE130464' and sessionId = '110'
Select * from Attend  where recordTime='2023-03-12 18:45:48.957'
Insert into Attend(studentId,sessionId,[status],recordTime,comment) values (?,?,?,?,?)
--Group 
Select g.instructorId,g. from [Group] g
inner join Instructor i on g.instructorId=i.instructorId

Select * from AttendTest

Select * from [group]

Insert into AttendTest(studentId,sessionId,[status],recordTime,comment) values (?,?,?,?,?)

--User
Select instructorId,instructorName From Instructor where instructorId = 'sonnt5' and [password] = '1'

Select studentid,studentName,password From Student where instructorId = ? and password = ?

--Get %Absent
select s.studentId, sum(1 - CAST(a.[status] as int)) as absentCount from Student s left join Attend a on s.studentId = a.studentId left join [Session] ses on a.sessionId = ses.sessionId where ses.groupId = 10 group by s.studentId

select *from [Group] where groupId = '15'  
create proc getAbsentCount
@groupId int
as 
begin
	select s.studentId, sum(1 - CAST(a.[status] as int)) as absentCount
	from Student s left join Attend a on s.studentId = a.studentId
	left join [Session] ses on a.sessionId = ses.sessionId
	where ses.groupId = @groupId  
	group by s.studentId
end

exec getAbsentCount @groupId=10;