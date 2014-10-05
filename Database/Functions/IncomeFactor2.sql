/****** Object:  User Defined Function dbo.IncomeFactor2    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.IncomeFactor2
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT RaceType FROM Kingdoms WHERE RaceType = Kingdoms.RaceType)
END
