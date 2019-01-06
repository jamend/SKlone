/****** Object:  User Defined Function dbo.CalcResearchPercent    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcResearchPercent
	(
		@kdID int,
		@ResearchType tinyint
	)
RETURNS tinyint
BEGIN
	DECLARE @Percent real
	IF dbo.PlanetType(@kdID) = 1 AND @ResearchType = 4
	BEGIN
		SET @Percent = 25
	END
	ELSE
	BEGIN
		DECLARE @Factor real
		DECLARE @MaxPercent tinyint
		DECLARE @Points real
		DECLARE @PlanetTypeFactor real
		DECLARE @RaceTypeFactor real
		SET @RaceTypeFactor = (SELECT ResearchFactor FROM RaceTypes WHERE RaceType = dbo.RaceType(@kdID))
		SET @PlanetTypeFactor = (SELECT ResearchFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@kdID))
		SET @Points = (SELECT Points FROM Research WHERE kdID = @kdID AND ResearchType = @ResearchType)
		IF @ResearchType = 0
		BEGIN
			SET @Factor = 0.0095
			SET @MaxPercent = 20
		END
		IF @ResearchType = 1
		BEGIN
			SET @Factor = 0.00623
			SET @MaxPercent = 50
		END
		IF @ResearchType = 2
		BEGIN
			SET @Factor = 0.006
			SET @MaxPercent = 30
		END
		IF @ResearchType = 3
		BEGIN
			SET @Factor = 0.0107
			SET @MaxPercent = 25
		END
		IF @ResearchType = 4
		BEGIN
			SET @Factor = 0.0173
			SET @MaxPercent = 25
		END
		IF @ResearchType = 5 SET @Factor = 60000
		IF @ResearchType = 6 SET @Factor = 72000
		IF @ResearchType = 7 SET @Factor = 600000
		IF @ResearchType = 8 SET @Factor = 30000
		IF @ResearchType = 9 SET @Factor = 15000
		IF @ResearchType = 10 SET @Factor = 20000
		IF @ResearchType = 11 SET @Factor = 20000
		IF @ResearchType = 12 SET @Factor = 20000
		IF @ResearchType = 13 SET @Factor = 20000
		IF @ResearchType < 5
		BEGIN
			DECLARE @TotalFactor real
			SET @TotalFactor = @PlanetTypeFactor + @RaceTypeFactor
			DECLARE @Land bigint
			SET @Land = POWER((SELECT CAST(Land AS bigint) FROM Land WHERE kdID = @kdID), 2) * @TotalFactor
			IF @Land * @Factor = 0
			SET @Percent = 100
			ELSE
			SET @Percent = (@Points / (@Land * @Factor)) * @MaxPercent
			IF @Percent > @MaxPercent SET @Percent = @MaxPercent
		END
		ELSE
		BEGIN
			SET @TotalFactor = @PlanetTypeFactor + @RaceTypeFactor
			IF @TotalFactor = 0 
			BEGIN
			SET @TotalFactor = 0.000001
			END
			SET @Factor = @Factor * @TotalFactor
			IF @Points = 0
			SET @Percent = 0
			ELSE
			SET @Percent = (@Points / @Factor) * 100
			IF @Percent > 100 SET @Percent = 100
		END
	END
	IF @Percent IS NULL
	BEGIN
	SET @Percent = 0
	END
	RETURN(@Percent)
END
