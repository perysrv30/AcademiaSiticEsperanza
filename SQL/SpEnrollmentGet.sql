IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Enrollments].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Enrollments].[Get]
END
GO
CREATE PROCEDURE [Enrollments].[Get]
	@EnrollmentsId			INT  = NULL
AS
BEGIN 
	SELECT EnrollmentsId, StudentsId, CursesId, EnrollmentDate FROM Enrollments
	WHERE EnrollmentsId= @EnrollmentsId
END
GO
EXEC sp_recompile N'[Enrollments].[Get]'


EXEC [Enrollments].[Get] 1

EXEC [Enrollments].[Get] 