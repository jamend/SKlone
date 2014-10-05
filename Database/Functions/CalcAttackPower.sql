/****** Object:  User Defined Function dbo.CalcAttackPower    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcAttackPower
	(
		@Attacker int,
		@Defender int,
		@WLs int,
		@Soldiers bigint,
		@Troopers bigint,
		@Dragoons bigint,
		@Tanks bigint,
		@TFs bigint,
		@SpecialOps bigint,
		@Interceptors bigint,
		@Sabres bigint,
		@Lancers bigint
	)
RETURNS bigint
BEGIN
	
	DECLARE @Sector1 int
	DECLARE @Sector2 int
	DECLARE @RawPower bigint
	DECLARE @AttackPower bigint
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	DECLARE @Factor real
	DECLARE @RaceFactor real
	SET @Sector1 = @AttackerSector
	SET @Sector2 = @DefenderSector
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Factor = (SELECT AttackFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@Attacker)) + ((SELECT ResearchPercent FROM Research WHERE ResearchType = 2 AND kdID = @Attacker) / 100) + (@WLs - 1) * 0.03 
	SET @RaceFactor = (SELECT AttackFactor FROM RaceTypes WHERE RaceType = dbo.RaceType(@Attacker)) 
	SET @Factor = @Factor + @RaceFactor
	IF dbo.GetSL(@AttackerSector) = @Attacker 
	BEGIN
		SET @Factor = @Factor + 0.1
	END
	IF (SELECT [Power] FROM Kingdoms WHERE kdID = @Attacker) = 0 
	BEGIN
		SET @Factor = @Factor - 0.2
	END
	IF dbo.AllianceRelation(@Sector1, @Sector2) = 1 
	BEGIN
		SET @Factor = @Factor + (SELECT AttackStrengthBonus FROM AllianceRelationTypes WHERE RelationType = 1)
	END
	SET @RawPower = CAST(@Soldiers AS bigint) + @Troopers * 4 + @Dragoons * 5 + @Tanks * 9 + @TFs * 10 + @SpecialOps * 4 + @Interceptors * 3 + @Sabres * 5 + @Lancers * 5
	SET @AttackPower = @RawPower * @Factor
	RETURN(@AttackPower)
END
