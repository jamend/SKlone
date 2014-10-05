/****** Object:  User Defined Function dbo.FreeLand    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.FreeLand
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(dbo.KingdomLand(@kdID) - (SELECT SUM(Built) + SUM(dbo.UnderConstruction(kdID, BuildingType)) FROM Buildings WHERE kdID = @kdID))
END
