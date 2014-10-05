/****** Object:  User Defined Function dbo.BuildingName    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.BuildingName
	(
		@BuildingType tinyint
	)
RETURNS nvarchar(24)
BEGIN
	DECLARE @Result nvarchar(24)
	IF @BuildingType = 0 SET @Result = 'Residence'
	IF @BuildingType = 1 SET @Result = 'Barracks'
	IF @BuildingType = 2 SET @Result = 'Air Support Bay'
	IF @BuildingType = 3 SET @Result = 'Nuclear Power Plant'
	IF @BuildingType = 4 SET @Result = 'Fusion Power Plant'
	IF @BuildingType = 5 SET @Result = 'Star Mine'
	IF @BuildingType = 6 SET @Result = 'Training Camp'
	IF @BuildingType = 7 SET @Result = 'Probe Factory'
	RETURN(@Result)
END
