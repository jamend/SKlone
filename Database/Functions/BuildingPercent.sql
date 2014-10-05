/****** Object:  User Defined Function dbo.BuildingPercent    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.BuildingPercent
	(
		@kdID int,
		@BuildingType tinyint
	)
RETURNS nvarchar(8)
BEGIN
	DECLARE @Percent nvarchar(8)
	DECLARE @Built real
	SET @Built = (SELECT Built FROM Buildings WHERE kdID = @kdID AND BuildingType = @BuildingType)
	SET @Percent = ROUND((@Built / dbo.KingdomLand(@kdID) * 100), 0)
	RETURN(@Percent + '%')
END
