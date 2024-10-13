IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Curses].[Delete]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Curses].[Delete]
END
GO
CREATE PROCEDURE [Curses].[Delete]
	@CusresId			INT
AS
BEGIN 
	DELETE Curses
	WHERE CursesId = @CusresId
END
GO
EXEC sp_recompile N'[Curses].[Delete]'
-- Usar siempre begin tran 

EXEC [Curses].[Delete]
5