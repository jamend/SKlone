/****** Object:  User Defined Function dbo.PlanetTypeName    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PlanetTypeName
	(
		@PlanetType tinyint
	)
RETURNS nvarchar(24)
BEGIN
	RETURN(SELECT PlanetTypeName FROM PlanetTypes WHERE PlanetType = @PlanetType)
END
