/****** Object:  User Defined Function dbo.PowerLoss    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PowerLoss
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS int
BEGIN
	DECLARE @Built bigint
	DECLARE @PowerLoss real
	DECLARE @PowerLossB real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Built = (SELECT Built FROM Buildings WHERE (BuildingType = 3) AND kdID = @Defender)
	SET @PowerLossB = @Probes/100
	IF @PowerLossB >= @Built * .05
	SET @PowerLoss = @Built * .05
	ELSE
	SET @PowerLoss = @Probes/100
	RETURN(@PowerLoss)
END
