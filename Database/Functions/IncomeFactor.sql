/****** Object:  User Defined Function dbo.IncomeFactor    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.IncomeFactor
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT PlanetType FROM Kingdoms WHERE PlanetType = Kingdoms.PlanetType)
END
