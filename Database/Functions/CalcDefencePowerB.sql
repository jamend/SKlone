/****** Object:  User Defined Function dbo.CalcDefencePowerB    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcDefencePowerB
	(
		@DSoldiers bigint,
		@DLTroopers bigint,
		@DLDragoons bigint,
		@DTanks bigint,
		@DTFs bigint,
		@DSpecialOps bigint,
		@DInterceptors bigint,
		@DSabres bigint,
		@DLancers bigint,
		@DPlanetType int,
		@DRaceType int,
		@DResearch int
	)
RETURNS bigint
BEGIN
	DECLARE @RawPower bigint
	DECLARE @DefencePower bigint
	DECLARE @Factor real
	SET @Factor = (SELECT DefenceFactor FROM PlanetTypes WHERE PlanetType = @DPlanetType) + (@DResearch / 100)
	SET @RawPower = @DSoldiers + @DLTroopers * 4 + @DLDragoons * 5 + @DTanks * 9 + @DTFs * 4 + @DSpecialOps * 3 + @DInterceptors * 5 + @DSabres * 1 + @DLancers * 5
	SET @DefencePower = @RawPower * @Factor
	RETURN(@DefencePower)
END
