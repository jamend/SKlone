/****** Object:  User Defined Function dbo.AllianceSectorNetworth    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceSectorNetworth
	(
		@AllianceID int,
		@SectorID int
	)
RETURNS bigint
BEGIN
	DECLARE @Networth bigint
	SET @Networth = (SELECT SUM(Networth) FROM Kingdoms WHERE SectorID = @SectorID AND (SELECT AllianceID FROM Sectors) = @AllianceID)
	IF @Networth > 0
	BEGIN
		SET @Networth = 0
	END
	RETURN(@Networth)
END
