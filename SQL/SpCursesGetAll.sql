IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Curses].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Curses].[GetAll]
END
GO
CREATE PROCEDURE [Curses].[GetAll]
	@CursesId			INT  = NULL
AS
BEGIN 
	SELECT CursesId, Name, Credits FROM Curses
	WHERE @CursesId IS NULL OR (CursesId IS NOT NULL AND CursesId= @CursesId) --Tabla Chica
END
GO
EXEC sp_recompile N'[Curses].[GetAll]'


EXEC [Curses].[GetAll] 1

EXEC [Curses].[GetAll] 