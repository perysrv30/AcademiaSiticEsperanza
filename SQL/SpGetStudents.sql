IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Students].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Students].[GetAll]
END
GO
CREATE PROCEDURE [Students].[GetAll]
	@StudentsId			INT  = NULL
AS
BEGIN 
	SELECT StudentsId, Name, DateOfBirth, Email FROM Students
	WHERE @StudentsId IS NULL OR (StudentsId IS NOT NULL AND StudentsId = @StudentsId) --Tabla Chica
END
GO
EXEC sp_recompile N'[Students].[GetAll]'


EXEC [Students].[GetAll] 1

EXEC [Students].[GetAll] 