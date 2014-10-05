/****** Object:  User Defined Function dbo.Disbandable    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.Disbandable
	(
		@kdID int,
		@UnitType tinyint
	)
RETURNS int
BEGIN
	DECLARE @Result int
	DECLARE @Complete int
	SET @Complete = (SELECT COMPLETE FROM UnitsTraining WHERE UnitType = @unitType AND kdID = @kdID)
	IF @UnitType = 7
	BEGIN
		SET @Result = @Complete - dbo.ScientistsOnJob(@kdID)
	END
	ELSE
	BEGIN
		SET @Result = @Complete
	END
	RETURN(@Result)
END
