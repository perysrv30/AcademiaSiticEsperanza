DECLARE @StudentId INT
EXEC [Students].[Insert] 
'ESPERANZA ROMERO', '19970130', 
'esperanza.romero@hotmail.com', @StudentId OUTPUT

SELECT @StudentId