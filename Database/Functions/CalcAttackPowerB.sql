/****** Object:  User Defined Function dbo.CalcAttackPowerB    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcAttackPowerB
	(
		@WLs int,
		@ASoldiers bigint,
		@ATroopers bigint,
		@ADragoons bigint,
		@ATanks bigint,
		@ATFs bigint,
		@ASpecialOps bigint,
		@AInterceptors bigint,
		@ASabres bigint,
		@ALancers bigint,
		@APlanetType int,
		@ARaceType int,
		@AResearch int
		
	)
RETURNS bigint
BEGIN
	
	DECLARE @RawPower bigint
	DECLARE @AttackPower bigint
	DECLARE @Factor real
	DECLARE @RaceFactor real
	SET @Factor = (SELECT AttackFactor FROM PlanetTypes WHERE PlanetType = @APlanetType) + (@AResearch/ 100) + (@WLs - 1) * 0.03 
	SET @RaceFactor = (SELECT AttackFactor FROM RaceTypes WHERE RaceType = @ARaceType) 
	SET @Factor = @Factor + @RaceFactor
	SET @RawPower = CAST(@ASoldiers AS bigint) + @ATroopers * 4 + @ADragoons * 5 + @ATanks * 9 + @ATFs * 10 + @ASpecialOps * 4 + @AInterceptors * 3 + @ASabres * 5 + @ALancers * 5
	SET @AttackPower = @RawPower * @Factor
	RETURN(@AttackPower)
END
