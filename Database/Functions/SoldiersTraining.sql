/****** Object:  User Defined Function dbo.SoldiersTraining    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SoldiersTraining
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Training0 + Training1 + Training2 + Training3 + Training4 + Training5 + Training6 + Training7 + Training8 + Training9 + Training10 + Training11 + Training12 + Training13 + Training14 + Training15 + Training16 + Training17 + Training18 + Training19 + Training20 + Training21 + Training22 + Training23 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 0)
END
