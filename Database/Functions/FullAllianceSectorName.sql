/****** Object:  User Defined Function dbo.FullAllianceSectorName    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.FullAllianceSectorName
	(
		@AllianceID int
	)
RETURNS nvarchar(96)
BEGIN
	DECLARE @Name nvarchar(96)
	SET @Name = (SELECT ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' + SectorName  FROM Sectors WHERE SectorID = SectorID AND AllianceID = @AllianceID)
	RETURN(@Name)
END
