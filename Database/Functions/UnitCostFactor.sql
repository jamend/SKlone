/****** Object:  User Defined Function dbo.UnitCostFactor    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitCostFactor
	(
		@kdID int
	)
RETURNS real
BEGIN
	DECLARE @Factor real
	SET @Factor = (SELECT Built FROM Buildings WHERE BuildingType = 6 AND kdID = @kdID)
	SET @Factor = (@Factor / dbo.KingdomLand(@kdID)) * 3
	IF @Factor > 0.3 SET @Factor = 0.3
	RETURN(1 - @Factor)
END
