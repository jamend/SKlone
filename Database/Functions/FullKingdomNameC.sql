/****** Object:  User Defined Function dbo.FullKingdomNameC    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.FullKingdomNameC
	(
		@kdID int
	)
RETURNS nvarchar(100)
BEGIN
	DECLARE @Name nvarchar(100)
	SET @Name = (SELECT Kingdoms.[Name] + ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
	IF @Name IS NULL SET @Name = 'Nobody'
	RETURN(@Name)
END
