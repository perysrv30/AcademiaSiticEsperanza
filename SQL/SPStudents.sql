IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Students].[Insert]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Students].[Insert]
END
GO
CREATE PROCEDURE [Students].[Insert]
	@Name				VARCHAR (150), 
	@DateOfBirth		DATE, 
	@Email				VARCHAR (100),
	@StudentId			INT	OUTPUT
AS
BEGIN 
	INSERT INTO Students(Name, DateOfBirth, Email)
	VALUES (@Name, @DateOfBirth, @Email)

	--SELECT SCOPE_IDENTITY() -- muestra el identificador
	SET @StudentId = SCOPE_IDENTITY() -- muesta el id de la tabla 
END
GO
EXEC sp_recompile N'[Students].[Insert]'
-- WITH ENCRYPTION ecriptar para mayor seguridad para que no se pueda ver el sp