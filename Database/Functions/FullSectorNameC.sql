/****** Object:  User Defined Function dbo.FullSectorNameC    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullSectorNameC
	(
		@SectorID int
	)
RETURNS nvarchar(96)
BEGIN
	DECLARE @Name nvarchar(96)
	DECLARE @AllianceID int
	SET @Name = (SELECT SectorName + ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' FROM Sectors WHERE SectorID = @SectorID)
	SET @AllianceID = (SELECT AllianceID FROM Sectors WHERE SectorID = @SectorID)
	IF @AllianceID != 0 SET @Name = @Name + ' <font color=orange>[' + dbo.AllianceName(@AllianceID) + '] </font>' 
	RETURN(@Name)
END
