/****** Object:  User Defined Function dbo.FusionLoss    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.FusionLoss
	(
		@Attacker int,
		@Defender int
	)
RETURNS int
BEGIN
	DECLARE @Land int
	DECLARE @LandGain real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Land = (SELECT Land FROM Land WHERE kdID = @Defender)
	SET @LandGain = (@Land * .06)
	IF @AttackerSector = @DefenderSector
	BEGIN
		IF (@LandGain < 20) SET @LandGain = 20
	END
	ELSE
	BEGIN
		IF (@LandGain < 10) SET @LandGain = 10
	END
	IF (@LandGain > @Land) SET @LandGain = @Land
	RETURN(@LandGain)
END
