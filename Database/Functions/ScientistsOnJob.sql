/****** Object:  User Defined Function dbo.ScientistsOnJob    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.ScientistsOnJob
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT SUM(Scientists) FROM Research WHERE kdID = @kdID)
END
