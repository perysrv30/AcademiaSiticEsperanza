IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Enrollments].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Enrollments].[GetAll]
END
GO
CREATE PROCEDURE [Enrollments].[GetAll]
	@EnrollmentsId			INT  = NULL
AS
BEGIN 
	SELECT EnrollmentsId, StudentsId, CursesId, EnrollmentDate FROM Enrollments
	WHERE @EnrollmentsId IS NULL OR (EnrollmentsId IS NOT NULL AND EnrollmentsId= @EnrollmentsId) --Tabla Chica
END
GO
EXEC sp_recompile N'[Enrollments].[GetAll]'


EXEC [Enrollments].[GetAll] 1

EXEC [Enrollments].[GetAll] 