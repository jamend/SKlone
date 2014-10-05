/****** Object:  User Defined Function dbo.TFsHome    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.TFsHome
	(
		@kdID int
	)
RETURNS int
BEGIN
	DECLARE @UnitsAvailable int
	DECLARE @UnitsSupported int
	SET @UnitsAvailable = (SELECT Complete FROM UnitsTraining WHERE UnitType = 6 AND kdID = @kdID)
	SET @UnitsSupported = (SELECT Built * 35 FROM Buildings WHERE BuildingType = 2 AND kdID = @kdID)
	IF @UnitsAvailable > @UnitsSupported
	BEGIN
		SET @UnitsAvailable = @UnitsSupported
	END
	SET @UnitsAvailable = @UnitsAvailable - (SELECT SUM([Out]) FROM UnitsOut WHERE UnitType = 6 AND kdID = @kdID)
	RETURN(@UnitsAvailable)
END
