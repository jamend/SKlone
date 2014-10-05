/****** Object:  User Defined Function dbo.SectorsAllianceNetworth    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SectorsAllianceNetworth
	(
		@AllianceID int
	)
RETURNS bigint
BEGIN
	DECLARE @Networth bigint
	SET @Networth = (SELECT SUM(Networth) FROM Kingdoms WHERE SectorID = (SELECT SectorID FROM Sectors WHERE AllianceID = @AllianceID AND SectorID = 36))
	IF @Networth = Null
	BEGIN
		SET @Networth = 0
	END
	RETURN(@Networth)
END
