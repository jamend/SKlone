/****** Object:  User Defined Function dbo.FullSectorNameD    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.FullSectorNameD
	(
		@SectorID int
	)
RETURNS nvarchar(96)
BEGIN
	DECLARE @Name nvarchar(96)
	SET @Name = (SELECT ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' FROM Sectors WHERE SectorID = @SectorID)
	RETURN(@Name)
END
