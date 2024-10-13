IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Students].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Students].[Get]
END
GO
CREATE PROCEDURE [Students].[Get]
	@StudentsId			INT
AS
BEGIN 
	SELECT StudentsId, Name, DateOfBirth, Email FROM Students
	WHERE StudentsId = @StudentsId --Tabla Grande
END
GO
EXEC sp_recompile N'[Students].[Get]'
