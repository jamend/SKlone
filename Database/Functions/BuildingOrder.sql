/****** Object:  User Defined Function dbo.BuildingOrder    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.BuildingOrder
	(
		@BuildingType tinyint
	)
RETURNS tinyint
BEGIN
	DECLARE @Result tinyint
	IF @BuildingType = 0 SET @Result = 0
	IF @BuildingType = 1 SET @Result = 2
	IF @BuildingType = 2 SET @Result = 6
	IF @BuildingType = 3 SET @Result = 3
	IF @BuildingType = 4 SET @Result = 7
	IF @BuildingType = 5 SET @Result = 1
	IF @BuildingType = 6 SET @Result = 4
	IF @BuildingType = 7 SET @Result = 5
	RETURN(@Result)
END
