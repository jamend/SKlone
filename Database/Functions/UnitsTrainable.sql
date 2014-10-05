/****** Object:  User Defined Function dbo.UnitsTrainable    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitsTrainable
	(
		@kdID int,
		@UnitType tinyint
	)
RETURNS int
BEGIN
	DECLARE @Result int
	DECLARE @unitCost int
	SET @UnitCost = dbo.UnitCost(@kdID, @UnitType)
	IF @UnitType = 6
	BEGIN
		SET @Result = dbo.KingdomMoney(@kdID) / @UnitCost
	END
	ELSE
	BEGIN
		SET @Result = dbo.SoldiersHome(@kdID)
		IF (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) < (CAST(@Result AS bigint) * @UnitCost) SET @Result = dbo.KingdomMoney(@kdID) / @UnitCost
	END
	RETURN(@Result)
END
