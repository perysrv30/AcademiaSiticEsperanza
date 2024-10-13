IF NOT EXISTS (SELECT 1 FROM sys.schemas
WHERE name = 'Students')
BEGIN
	EXEC ('CREATE SCHEMA Students') -- ESQUEMAS 
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas
WHERE name = 'Curses')
BEGIN
	EXEC ('CREATE SCHEMA Curses')
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas
WHERE name = 'Enrollments')
BEGIN
	EXEC ('CREATE SCHEMA Enrollments')
END