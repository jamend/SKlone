/****** Object:  User Defined Function dbo.UnitOrder    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.UnitOrder
	(
		@UnitType tinyint
	)
RETURNS tinyint
BEGIN
	DECLARE @Result tinyint
	IF @UnitType = 0 SET @Result = 0
	IF @UnitType = 1 SET @Result = 3
	IF @UnitType = 2 SET @Result = 4
	IF @UnitType = 3 SET @Result = 1
	IF @UnitType = 4 SET @Result = 2
	IF @UnitType = 5 SET @Result = 5
	IF @UnitType = 6 SET @Result = 6
	IF @UnitType = 7 SET @Result = 7
	IF @UnitType = 8 SET @Result = 8
	IF @UnitType = 9 SET @Result = 9
	IF @UnitType = 10 SET @Result = 10
	IF @UnitType = 11 SET @Result = 11
	RETURN(@Result)
END
