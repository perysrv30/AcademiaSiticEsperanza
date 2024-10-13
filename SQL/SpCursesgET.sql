IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Curses].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Curses].[Get]
END
GO
CREATE PROCEDURE [Curses].[Get]
	@CursesId			INT  = NULL
AS
BEGIN 
	SELECT CursesId, Name, Credits FROM Curses
	WHERE  CursesId = @CursesId
END
GO
EXEC sp_recompile N'[Curses].[Get]'


EXEC [Curses].[Get] 1

EXEC [Curses].[Get] 