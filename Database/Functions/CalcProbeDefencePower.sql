/****** Object:  User Defined Function dbo.CalcProbeDefencePower    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcProbeDefencePower
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS bigint
BEGIN
	DECLARE @RawPower bigint
	DECLARE @DefencePower bigint
	DECLARE @Land bigint
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	DECLARE @ProbesB bigint
	SET @ProbesB = (SELECT Probes FROM Kingdoms WHERE kdID = @Defender)
	SET @Land = (SELECT Land FROM Land WHERE kdID = @Defender)
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	IF (@Land * 12) <= @Probes
	BEGIN
	SET @RawPower = @Land * 12
	END
	ELSE
	IF @ProbesB >=  0 
	BEGIN
	SET @RawPower = @ProbesB
	END
	SET @DefencePower = @RawPower
	RETURN(@DefencePower)
END
