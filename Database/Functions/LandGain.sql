/****** Object:  User Defined Function dbo.LandGain    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.LandGain
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
	DECLARE @Sector1 int
	DECLARE @Sector2 int
	SET @Sector1 = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @Sector2 = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Land = (SELECT Land FROM Land WHERE kdID = @Defender)
	SET @LandGain = ROUND(((@Land / 10) - (@Land * (SELECT MA / 100 FROM Kingdoms WHERE kdID = @Defender))), 0)
	IF dbo.AllianceRelation(@Sector1, @Sector2) = 1
	BEGIN
	SET @LandGain = @LandGain * 1.2
	END
	IF @Land <= 20
	BEGIN
		SET @LandGain = @Land
	END
	ELSE
	IF @AttackerSector = @DefenderSector
	BEGIN
		IF (@LandGain < 20) SET @LandGain = 20
	END
	ELSE
	BEGIN
		IF (@LandGain < 20) SET @LandGain = 20
	END
	RETURN(@LandGain)
END
