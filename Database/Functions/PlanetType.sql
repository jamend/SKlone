/****** Object:  User Defined Function dbo.PlanetType    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.PlanetType
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID)
END
