/****** Object:  User Defined Function dbo.NewPower    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.NewPower
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	DECLARE @MaxPower bigint
	DECLARE @NewPower bigint
	DECLARE @Nuclear bigint
	DECLARE @Fusion bigint
	SET @Nuclear = (SELECT Built FROM Buildings WHERE BuildingType = 3 AND kdID = @kdID)
	SET @Fusion = (SELECT Built FROM Buildings WHERE BuildingType = 4 AND kdID = @kdID)
	SET @NewPower = (SELECT Kingdoms.[Power] + (@Nuclear * 100 + @Fusion * 140) * PlanetTypes.PowerProducedFactor FROM Kingdoms, PlanetTypes WHERE PlanetTypes.PlanetType = Kingdoms.PlanetType AND Kingdoms.kdID = @kdID) - dbo.PowerNeeded(@kdID)
	SET @MaxPower = @Nuclear * 500 + @Fusion * 1000
	IF @NewPower > @Maxpower SET @NewPower = @MaxPower
	IF @NewPower < 0 SET @NewPower = 0
	RETURN(@NewPower)
END
