select * from [Uber project]..UberDataSet
--calculating the length of columns
select LEN(START_DATE) FROM [Uber project]..UberDataSet
--separating date from time in columns 
SELECT SUBSTRING(START_DATE,0,11) FROM [Uber project]..UberDataSet
 ALTER TABLE [Uber project]..UberDataSet
 ADD StartDate nvarchar(255);
 UPDATE [Uber project]..UberDataSet
 SET StartDate = SUBSTRING(START_DATE,0, 11)

 ALTER TABLE [Uber project]..UberDataSet
 DROP COLUMN 
 StartTime;
 ALTER TABLE [Uber project]..UberDataSet
 ADD EndtDate nvarchar(255);
 UPDATE [Uber project]..UberDataSet
 SET EndtDate = SUBSTRING(START_DATE,0, 11)

ALTER TABLE [Uber project]..UberDataSet
 ADD StartTime nvarchar(255);
UPDATE [Uber project]..UberDataSet
 SET StartTime = SUBSTRING(START_DATE,11,16)
 SELECT StartTime from [Uber project]..UberDataSet

 ALTER TABLE [Uber project]..UberDataSet
 ADD EndDate nvarchar(255);
 UPDATE [Uber project]..UberDataSet
 SET EndDate = SUBSTRING(END_DATE,0, 11)

ALTER TABLE [Uber project]..UberDataSet
 ADD EndTime nvarchar(255);
UPDATE [Uber project]..UberDataSet
 SET EndTime = SUBSTRING(END_DATE,11,16)
 SELECT EndTime from [Uber project]..UberDataSet

 --correcting locations names
 ALTER TABLE [Uber project]..UberDataSet
 DROP COLUMN START_DATE,END_DATE;

 SELECT START FROM [Uber project]..UberDataSet
 WHERE START like 'R?walpindi'

 UPDATE [Uber project]..UberDataSet
 SET START = 'Kar?chi', STOP='Kar?chi'
 where START = 'Kar?chi' OR STOP='Kar?chi';

 UPDATE [Uber project]..UberDataSet
 SET START = 'Rawalpindi', STOP='Rawalpindi'
 where START = 'R?walpindi' OR STOP='R?walpindi';

 SELECT * FROM [Uber project]..UberDataSet
 WHERE START='Unknown Location' and STOP='Unknown Location'

 DELETE FROM [Uber project]..UberDataSet
 WHERE START='Unknown Location' and STOP='Unknown Location'

--changing date format
SELECT EndDate from  [Uber project]..UberDataSet
where EndDate like '%[0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]%'

UPDATE [Uber project]..UberDataSet
SET EndDate=convert(nvarchar(255),EndDate,32)
where EndDate like '%[0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]%'

UPDATE [Uber project]..UberDataSet
SET StartDate=convert(nvarchar(255),EndDate,32)
where StartDate like '%[0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]%'

--Creating views
CREATE VIEW UberView AS
  SELECT * FROM [Uber project]..UberDataSet
  WHERE PURPOSE is not null