/****** Object:  User Defined Function dbo.UnitsOutPerWL    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitsOutPerWL
	(
		@kdID int,
		@UnitType tinyint,
		@WLID tinyint
	)
RETURNS int
BEGIN
	RETURN(SELECT [Out] FROM UnitsOut WHERE UnitType = @UnitType AND kdID = @kdID AND WLID = @WLID)
END
