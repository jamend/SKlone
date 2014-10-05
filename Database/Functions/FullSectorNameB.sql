/****** Object:  User Defined Function dbo.FullSectorNameB    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullSectorNameB
	(
		@SectorID int
	)
RETURNS nvarchar(128)
BEGIN
	DECLARE @Name nvarchar(128)
	DECLARE @AllianceID int
	SET @Name = (SELECT SectorName + ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' FROM Sectors WHERE SectorID = @SectorID)
	SET @AllianceID = (SELECT AllianceID FROM Sectors WHERE SectorID = @SectorID)
	IF @AllianceID > 0 SET @Name = (SELECT SectorName + ' <a href=AllianceInfo.aspx?AllianceID=' + CAST(@AllianceID AS nvarchar(8)) + '>[' + dbo.AllianceName(@AllianceID) + ']</a>' + ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' FROM Sectors WHERE SectorID = @SectorID) 
	RETURN(@Name)
END
