/****** Object:  User Defined Function dbo.CalcProbeAttackPower    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.CalcProbeAttackPower
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS bigint
BEGIN
	DECLARE @RawPower bigint
	DECLARE @AttackPower bigint
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @RawPower = @Probes
	SET @AttackPower = @RawPower
	RETURN(@AttackPower)
END
