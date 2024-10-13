IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Enrollments].[Insert]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Enrollments].[Insert]
END
GO 
CREATE PROCEDURE [Enrollments].[Insert]
	@CursesId INT,
	@StudentsId INT, 
	@EnrollmentDate DATE,
	@EnrollmentId INT OUTPUT
AS
BEGIN 
	INSERT INTO Enrollments(CursesId, StudentsId, EnrollmentDate)
	VALUES (@CursesId, @StudentsId, @EnrollmentDate)

	SET @EnrollmentId = SCOPE_IDENTITY()
END
GO 

EXEC sp_recompile N'[Enrollments].[Insert]'

DECLARE @Enrollment INT 
EXEC [Enrollments].[Insert]
2,3,'20240510', @Enrollment OUTPUT

SELECT @Enrollment

