/****** Object:  User Defined Function dbo.UnitCostFactorB    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitCostFactorB
	(
		@kdID int
	)
RETURNS real
BEGIN
	DECLARE @Factor real
	SET @Factor = (SELECT Built FROM Buildings WHERE BuildingType = 6 AND kdID = @kdID)
	SET @Factor = (@Factor / dbo.KingdomLand(@kdID)) * 3 + .2
	IF @Factor > 0.50 SET @Factor = 0.50
	RETURN(1 - @Factor)
END
