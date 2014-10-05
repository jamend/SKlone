/****** Object:  User Defined Function dbo.UnitName    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.UnitName
	(
		@UnitType tinyint
	)
RETURNS nvarchar(24)
BEGIN
	DECLARE @Result nvarchar(24)
	IF @UnitType = 0 SET @Result = 'Soldiers'
	IF @UnitType = 1 SET @Result = 'Troopers'
	IF @UnitType = 2 SET @Result = 'Dragoons'
	IF @UnitType = 3 SET @Result = 'Laser Troopers'
	IF @UnitType = 4 SET @Result = 'Laser Dragoons'
	IF @UnitType = 5 SET @Result = 'Tanks'
	IF @UnitType = 6 SET @Result = 'Tactical Fighters'
	IF @UnitType = 7 SET @Result = 'Scientists'
	IF @UnitType = 8 SET @Result = 'Special Ops'
	IF @UnitType = 9 SET @Result = 'Interceptors'
	IF @UnitType = 10 SET @Result = 'Sabres'
	IF @UnitType = 11 SET @Result = 'High Guard Lancers'
	RETURN(@Result)
END
