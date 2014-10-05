/****** Object:  User Defined Function dbo.ResLoss    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.ResLoss
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS int
BEGIN
	DECLARE @Built bigint
	DECLARE @ResLoss real
	DECLARE @ResLossB real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Built = (SELECT Built FROM Buildings WHERE (BuildingType = 0) AND kdID = @Defender)
	SET @ResLossB = @Probes/100
	IF @ResLossB >= @Built * .05
	SET @ResLoss = @Built * .05
	ELSE
	SET @ResLoss = @Probes/100
	RETURN(@ResLoss)
END
