
Create table Reports
(
 Id number generated by default on null as identity,
 RegionName varchar2(50),
 CrimeType varchar2(50),
 ReportDate varchar2(50),
 Description varchar2(900)
)

create table Feedback
(
 Feedback varchar2(1000),
 FeedbackDate varchar2(50)
)

Create table Users
(
 id number generated by default on null as identity,
 UserName varchar2(50),
 Password varchar2(50),
 PoliceId varchar2(50),
 Email varchar2(50),
 State varchar2(50)
)

create table EvidentImages
(
 id number generated by default on null as identity,
 image blob,
 cid number
)

create table EvidentVideos
(
 id number generated by default on null as identity,
 video blob,
 cid number
)

create table EvidentFiles
(
 id number generated by default on null as identity,
 files blob,
 cid number
)

select count(CrimeType) from Reports
select count(CrimeType) from Reports where RegionName='Kachin' group by RegionName

alter table Reports add Description varchar2(900)
alter table Reports drop column Description
select max(id) from Reports
select RegionName,count(CrimeType) from Reports group by RegionName

drop table Users 
drop table Reports 
delete from FEEDBACK

delete from Users where UserName='La Pyae Aung'
select * from Users
select * from EVIDENTIMAGES
select * from EVIDENTVIDEOS
select * from EVIDENTFILES
select * from REPORTS

select count(CrimeType) from Reports where RegionName='Kachin' group by RegionName

select count(CrimeType) from Reports where CrimeType='Homicide' and RegionName='Kachin' group by RegionName

select * from EvidentFiles where cid=62

select RegionName,CrimeType,count(CrimeType) from Reports group by RegionName,CrimeType

insert into REPORTS value(1, "Shan", "Robbery", "10/2/2024");

drop table UserData

update Users set UserName='Aung Min Thein',Password='KoKoYay',PoliceId='754328',Email='hennelaa@gmail.com',State='Sagaing' where id='1'
select UserName from Users where UserName='Jack'

drop table Users
select * from USERS
select * from Users where UserName='La Pyae Aung' and Password='lapyaeaung'
select Password from Users where UserName='Aung Min Thein'
delete from Users where UserName='Aung Min Thein'

select image from EvidentImages where cid=46
