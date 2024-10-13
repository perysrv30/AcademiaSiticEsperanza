IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Enrollments].[Update]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Enrollments].[Update]
END
GO
CREATE PROCEDURE [Enrollments].[Update]
	@EnrollmentsId			INT,
	@StudentsId				INT,
	@CursesId				INT,
	@EnrollmetDate			Date

AS
BEGIN 
	UPDATE Enrollments
	SET StudentsId = @StudentsId, 
		CursesId = @CursesId,
		EnrollmentDate = @EnrollmetDate
	WHERE EnrollmentsId = @EnrollmentsId
END
GO
EXEC sp_recompile N'[Enrollments].[Update]'


EXEC [Enrollments].[Update]
1, 2,2, '20240410'