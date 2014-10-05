/****** Object:  User Defined Function dbo.PopulationChange    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PopulationChange
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	DECLARE @MaxPopulation bigint
	DECLARE @MaxMilitary bigint
	DECLARE @MilitaryPopulation bigint
	DECLARE @NewPopulation bigint
	DECLARE @Population bigint
	DECLARE @Factor real
	DECLARE @NoPower real
	DECLARE @PopulationFactor real
	IF (SELECT [Power] FROM Kingdoms WHERE kdID = @kdID) = 0 SET @NoPower = 1 ELSE SET @NoPower = 0
	IF (SELECT [ResearchPercent] FROM Research WHERE kdID = @kdID AND ResearchType = 0) = 0
	SET @PopulationFactor = 0
	ELSE
	SET @PopulationFactor = (SELECT CAST([ResearchPercent] AS real) / 100 FROM Research WHERE kdID = @kdID AND ResearchType = 0) 
	SET @Factor = @PopulationFactor + (SELECT PopulationFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@kdID)) + (SELECT PopulationFactor FROM RaceTypes WHERE RaceType = dbo.RaceType(@kdID)) - @NoPower * 0.2
	SET @Population = (SELECT Population FROM Kingdoms WHERE kdID = @kdID)
	SET @MaxMilitary = (SELECT Built * 75 FROM Buildings WHERE BuildingType = 1 AND kdID = @kdID)
	SET @MaxPopulation = (SELECT Built * 50 FROM Buildings WHERE BuildingType = 0 AND kdID = @kdID) * @Factor
	SET @MilitaryPopulation = (SELECT SUM(Complete) FROM UnitsTraining WHERE UnitType != 5 AND UnitType != 6 AND kdID = @kdID) + ((SELECT Complete  FROM UnitsTraining WHERE UnitType = 5 AND kdID = @kdID) * 2)
	IF @MilitaryPopulation > @MaxMilitary BEGIN SET @MaxPopulation = @MaxPopulation - @MilitaryPopulation + @MaxMilitary END
	SET @NewPopulation = @Population
	IF @Population > @MaxPopulation 
	BEGIN
		IF @Population < 2000 SET @NewPopulation = @Population - 100 ELSE SET @NewPopulation = @Population - (@Population * 0.05)
	END
	ELSE
	BEGIN
		IF @MaxPopulation > @Population
		BEGIN
			IF @NoPower = 1 SET @NewPopulation = @Population + (@Population * 0.0025) ELSE SET @NewPopulation = @Population + (@Population * 0.025)
			IF @NewPopulation > @MaxPopulation SET @NewPopulation = @MaxPopulation
		END
	END
	RETURN(@NewPopulation - @Population)
END
