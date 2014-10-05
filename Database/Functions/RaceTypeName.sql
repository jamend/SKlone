/****** Object:  User Defined Function dbo.RaceTypeName    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.RaceTypeName
	(
		@RaceType tinyint
	)
RETURNS nvarchar(24)
BEGIN
	RETURN(SELECT RaceTypeName FROM RaceTypes WHERE RaceType = @RaceType)
END
