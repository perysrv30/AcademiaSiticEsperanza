-- CREATE DATABASE Exercises; 
-- USE Exercises;

-- ERROR AL MOMENTO DE CREAR UNA TABLA QUE YA EXISTE
--IF NOT EXISTS (SELECT  1 FROM dbo.sysobjects WHERE 
--id = OBJECT_ID(N'[dbo].[Students]') AND OBJECTPROPERTY(id, N'isUserTable') = 1) 
--BEGIN
--CREATE TABLE [User](
--	UserId INT PRIMARY KEY IDENTITY(1,1),
--	Username VARCHAR(50) NOT NULL,
--	Password VARCHAR(50) NOT NULL
--)
--END

--CREATE TABLE [dbo].[Students](
--		StudentsId INT PRIMARY KEY IDENTITY(1,1),
--		Name VARCHAR(150) NOT NULL,
--		DateOfBirth DATE NOT NULL,
--		Email VARCHAR(100)

--)

--CREATE TABLE [dbo].[Curses](
--		CursesId INT PRIMARY KEY IDENTITY(1,1),
--		Name VARCHAR(150) NOT NULL,
--		Credits int NOT NULL
--)

--CREATE TABLE [dbo].[Enrollments](
--		EnrollmentsId INT PRIMARY KEY IDENTITY(1,1),
--		StudentsId INT,
--		CursesId INT,
--		EnrollmentDate DATE NOT NULL,
--		FOREIGN KEY (StudentsId) REFERENCES Students(StudentsId),
--		FOREIGN KEY (CursesId) REFERENCES Curses(CursesId),
--)


SELECT * FROM Students
SELECT * FROM Curses
SELECT * FROM Enrollments