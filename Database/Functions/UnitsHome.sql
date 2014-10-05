/****** Object:  User Defined Function dbo.UnitsHome    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitsHome
	(
		@kdID int,
		@UnitType tinyint
	)
RETURNS int
BEGIN
	DECLARE @Result int
	IF @UnitType = 6
	BEGIN
		SET @Result = dbo.TFsHome(@kdID)
	END
	ELSE
	BEGIN
		SET @Result = (SELECT Complete FROM UnitsTraining WHERE UnitType = @UnitType AND kdID = @kdID) - (SELECT SUM([Out]) FROM UnitsOut WHERE UnitType = @UnitType  AND kdID = @kdID)
	END
	RETURN(@Result)
END
