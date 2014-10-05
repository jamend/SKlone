/****** Object:  User Defined Function dbo.ScientistsAvailable    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.ScientistsAvailable
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN((SELECT Complete FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 7) - dbo.ScientistsOnJob(@kdID))
END
