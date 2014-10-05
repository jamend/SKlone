/****** Object:  User Defined Function dbo.SoldiersHome    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.SoldiersHome
	(
		@kdID int
	)
RETURNS int
BEGIN
	DECLARE @Result int
	BEGIN
		SET @Result = (SELECT Complete FROM UnitsTraining WHERE UnitType = 0 AND kdID = @kdID) - (SELECT SUM([Out]) FROM UnitsOut WHERE UnitType = 0  AND kdID = @kdID)
	END
	RETURN(@Result)
END
