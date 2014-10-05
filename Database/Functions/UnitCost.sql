/****** Object:  User Defined Function dbo.UnitCost    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitCost
	(
		@kdID int,
		@UnitType int
	)
RETURNS int
BEGIN
	DECLARE @Result int
	DECLARE @MilitaryCostFactor real
	SET @MilitaryCostFactor = (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID)
	IF @UnitType = 1 SET @Result = 350
	IF @UnitType = 2 SET @Result = 450
	IF @UnitType = 3 SET @Result = 400
	IF @UnitType = 4 SET @Result = 550
	IF @UnitType = 5 SET @Result = 1750
	IF @UnitType = 6 SET @Result = 1800
	IF @UnitType = 7 SET @Result = 1000
	IF @UnitType = 8 SET @Result = 600
	IF @UnitType = 9 SET @Result = 650
	IF @UnitType = 10 SET @Result = 520
	IF @UnitType = 11 SET @Result = 850
	IF @MilitaryCostFactor = 9 SET @Result = @Result * dbo.UnitCostFactorB(@kdID)
	ELSE
	SET @Result = @Result * dbo.UnitCostFactor(@kdID)
	IF @UnitType = 0 SET @Result = 150
	RETURN(@Result)
END
