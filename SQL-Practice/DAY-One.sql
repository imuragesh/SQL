/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [FirstName]
      ,[LastName]
      ,[Age]
  FROM [CUSTOMER].[dbo].[CUSTOMER]
	



  ---How to delet the duplicate records from the table 
 --WITH CTC AS(
 --SELECT * ,
 --    ROW_NUMBER() OVER (PARTITION  BY [FirstName],[LastName],[Age]
 --    ORDER BY (SELECT NULL)) as row_numb
	-- FROM CUSTOMER
 --)
 --DELETE  FROM CTC WHERE row_numb>1
 --AND row_numb=2

 --DELETE FROM dbo.CUSTOMER where age is null


 --Delete top (1) [dbo].[CUSTOMER]

 ----UPDATE FIRTICULAR ROW----
 --UPDATE DBO.CUSTOMER
 --SET AGE=24
 --WHERE AGE=12
 


 UPDATE dbo.CUSTOMER 
 SET FirstName ='Mike'
 WHERE FirstName like N'%MIke%'


 
--structure query language 
-- SQL is programing language ue to talk to data bases
-- SQL server ,oracle , mysql ,postgre sql ,SQLite  DB2 ,BigData
-- tool to  write sql 
--1 (SSMS)SQL SERVE Management studio.
--2 SQL Developer(oracle)
--3 SQL WORKBanch (my sql )
--4 TOAD 

--CREATE DATABASE 

USE CUSTOMER


-- CREATE DATABASE 
CREATE  DATABASE CUSTOMER 
IF NOT EXISTS (
	SELECT
	NAME 
	FROM SYS.DATABASES 
	WHERE NAME =N'CUSTOMER'
	)
  BEGIN 
	CREATE  DATABASE CUSTOMER;
	 PRINT N'The data base CUSTOMER is not prene t and data base created successfully'
  END 
ELSE 
   BEGIN
     PRINT N'Data base with the name customer is present';
   END

GO 

---- CREATING TABLE 

    
   IF NOT Exists (select name from sys.tables where  name ='CUSTOMER')
   BEGIN
       CREATE TABLE CUSTOMER
       (
       FirstName NVARCHAR (90),
       LastName  NVARCHAR (90),
       Age  INT 
       );
	   PRINT 'Customer table is created successfully'
	END
	ELSE 
	BEGIN
	  PRINT N'CUSTOMER Table Is Already is exist.'
	END


	--- SELECT TOP 100
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [FirstName]
      ,[LastName]
      ,[Age]
  FROM [CUSTOMER].[dbo].[CUSTOMER]


  -- Insert into values into tables

 INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Muragesh',N'Hipparagi',23,N'Bangalore');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Joy',N'Blue',24,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'Schmidt2',32,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age])
 VALUES (N'barry ',N'bonds',23,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'schmidt1',40,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'schmidt3',31,N'goddard');
 
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])

 VALUES (N'mike',N'schimidt',30,N'goddard');


 SELECT * FROM CUSTOMER 


 --BASIC WAY OF SELECTING  THE DATA

-- Rertive the all the column

 SELECT * FROM CUSTOMER

-- TO retrive the perticular columns

  SELECT 
  FirstName,
  LastName,
  Age
	FROM CUSTOMER

--WHERE CLAUSE

	   SELECT 
		 FirstName,
		 LastName,
		 Age
		  FROM CUSTOMER 
		  WHERE FirstName='mike'
		  AND LastName Like N'%schmidt%'

--  UPADTE CLAUSE

	UPDATE dbo.CUSTOMER
	SET LastName ='schmidt'
	WHERE LastName LIKE N'%schimidt%'

-- truncate pull data from the table

   TRUNCATE TABLE  dbo.customer

-- If you Want DROP the Table 

   DROP TABLE dbo.CUSTOMER

-- Alter table  (Add columns)
   ALTER TABLE customer 
   ADD   City NVARCHAR (90);

--Update City 
      
      UPDATE dbo.CUSTOMER
      SET City='goddard'
      where firstName='mike'

-- DROP Table 
DROP TABLE  dbo.CUSTOMER

--DELETE  FROM CTC WHERE row_numb>1
 --AND row_numb=2

 --DELETE FROM dbo.CUSTOMER where age is null


 --Delete top (1) [dbo].[CUSTOMER]

 ----UPDATE FIRTICULAR ROW----
 --UPDATE DBO.CUSTOMER
 --SET AGE=24
 --WHERE AGE=12
 


 UPDATE dbo.CUSTOMER 
 SET FirstName ='Mike'
 WHERE FirstName like N'%MIke%'




--RECREATE  same table with city and identity as id

IF NOT EXISTS( SELECT NAME fROM sys.tables)
BEGIN
      CREATE TABLE CUSTOMER
      (
        ID INT PRIMARY KEY IDENTITY(1,1),
        FirstName VARCHAR(90),
        LastName VARCHAR(90),
        Age INT,
        City NVARCHAR(50)
      )
END
ELSE
BEGIN
	PRINT N'TABLE IS ALREADY PRESENT PLEASE DROP BEFORE CREATING OR ALTER IT'
END

INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Muragesh',N'Hipparagi',23,N'Bangalore');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Joy',N'Blue',24,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'Schmidt2',32,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age] ,[City])
 VALUES (N'barry ',N'bonds',23,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'schmidt1',40,N'goddard');
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])
 VALUES (N'Mike',N'schmidt3',31,N'goddard');
 
 GO
  INSERT INTO DBO.CUSTOMER 
 ([FirstName],[LastName],[Age],[City])

 VALUES (N'mike',N'schimidt',30,N'goddard');


 IF NOT EXISTS (SELECT Name FROM sys.tables where name='products')

   BEGIN
   CREATE TABLE PRODUCTS
   (
     ID INT PRIMARY KEY IDENTITY(1,1),
	 Product VARCHAR (100),
	 Pice float
   )
   END
   ELSE
   PRINT N'THE table Produt is present'
   
   
GO



CREATE TABLE Orders
(
   Orderid INT PRIMARY KEY IDENTITY (1,1),
   OrderDate DATETIME ,
   CustomerID INT,
   ProdutID INT
);

SELECT * FROM CUSTOMER

SELECT * FROM PRODUCTS

insert into PRODUCTS 
values ('Iqooo',36000)

SELECT * FROM ORDERS

INSERT INTO ORDERS
VALUES (GETDATE (),1,2)




Alter Table ORDERS
ADD FOREIGN KEY (CustomerId) references customer(ID) 


Alter Table orders
ADD FOREIGN KEY (ProdutID) REFERENCES products(ID)	








SELECT  
  o.*,p.*,c.* 
  FROM Orders AS o
			INNER JOIN PRODUCTS AS p ON o.ProdutID=p.ID
			INNER JOIN CUSTOMER AS C ON c.ID=o.CustomerID





SELECT  
   c.LastName,
  sum(p.price)
  FROM Orders AS o
			INNER JOIN PRODUCTS AS p ON o.ProdutID=p.ID
			INNER JOIN CUSTOMER AS C ON c.ID=o.CustomerID
			Group by c.LastName


			--sp_rename 'PRODUCTS.pice','price' ,'column'

 