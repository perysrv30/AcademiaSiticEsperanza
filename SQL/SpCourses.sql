IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Curses].[Insert]') AND
type in (N'P', N'PC'))
BEGIN 
	DROP PROCEDURE [Curses].[Insert]
END 
GO 
CREATE PROCEDURE [Curses].[Insert]
	@Name		VARCHAR(150),
	@Credits	INT,
	@CursesId	INT OUTPUT
AS
BEGIN 
		INSERT INTO Curses(Name, Credits)
		VALUES (@Name, @Credits)

		SET @CursesId = SCOPE_IDENTITY()
END
GO
EXEC sp_recompile N'[Curses].[Insert]'


DECLARE @CursesId INT 
EXEC [Curses].[Insert]
'CIENCIAS 3', 150, @CursesId OUTPUT

SELECT @CursesId 