/****** Object:  User Defined Function dbo.AllianceSectors    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceSectors
	(
		@AllianceID int
	)
RETURNS nvarchar(96)
BEGIN
	DECLARE @Name nvarchar(96)
	SET @Name = (SELECT SectorName + ' (' + CAST(Galaxy AS nvarchar(2)) + ':' + CAST(Sector AS nvarchar(2)) + ')' FROM Sectors WHERE SectorID = 36 AND AllianceID = @AllianceID)
	RETURN(@Name)
END
