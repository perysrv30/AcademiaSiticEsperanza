IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Curses].[Update]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Curses].[Update]
END
GO
CREATE PROCEDURE [Curses].[Update]
	@CursesId			INT,
	@Name				VARCHAR (150), 
	@Credits			INT 
AS
BEGIN 
	UPDATE Curses
	SET Name = @Name, 
		Credits = @Credits 
	WHERE CursesId = @CursesId
END
GO
EXEC sp_recompile N'[Curses].[Update]'


EXEC [Curses].[Update]
2, 'MATEMATICAS 5', 250