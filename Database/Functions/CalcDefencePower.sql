/****** Object:  User Defined Function dbo.CalcDefencePower    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.CalcDefencePower
	(
		@Attacker int,
		@Defender int
	)
RETURNS bigint
BEGIN
	DECLARE @RawPower bigint
	DECLARE @DefencePower bigint
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	DECLARE @Soldiers bigint
	DECLARE @LTroopers bigint
	DECLARE @LDragoons bigint
	DECLARE @Tanks bigint
	DECLARE @TFs bigint
	DECLARE @SpecialOps bigint
	DECLARE @Interceptors bigint
	DECLARE @Sabres bigint
	DECLARE @Lancers bigint
	DECLARE @Factor real
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Factor = (SELECT DefenceFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@Defender)) + ((SELECT ResearchPercent FROM Research WHERE ResearchType = 2 AND kdID = @Defender) / 100)
	IF (SELECT [Power] FROM Kingdoms WHERE kdID = @Defender) = 0 
	BEGIN
		SET @Factor = @Factor - 0.2
	END
	SET @Soldiers = dbo.SoldiersHome(@Defender)
	SET @LTroopers = dbo.UnitsHome(@Defender, 3)
	SET @LDragoons = dbo.UnitsHome(@Defender, 4)
	SET @Tanks = dbo.UnitsHome(@Defender, 5)
	SET @TFs = dbo.TFsHome(@Defender)
	SET @SpecialOps = dbo.UnitsHome(@Defender, 8)
	SET @Interceptors = dbo.UnitsHome(@Defender, 9)
	SET @Sabres = dbo.UnitsHome(@Defender, 10)
	SET @Lancers = dbo.UnitsHome(@Defender, 11)
	SET @RawPower = @Soldiers + @LTroopers * 4 + @LDragoons * 5 + @Tanks * 9 + @TFs * 4 + @SpecialOps * 3 + @Interceptors * 5 + @Sabres * 1 + @Lancers * 5
	IF dbo.GetSL(@DefenderSector) = @Defender 
	BEGIN
		SET @Factor = @Factor + 0.1
	END
	SET @DefencePower = @RawPower * @Factor
	RETURN(@DefencePower)
END
