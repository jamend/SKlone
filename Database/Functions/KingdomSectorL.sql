/****** Object:  User Defined Function dbo.KingdomSectorL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.KingdomSectorL
	(
		@kdID int
	)
RETURNS nvarchar(50)
BEGIN
	DECLARE @Total nvarchar(50)
	SET @Total = (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
	RETURN(@Total)
END
