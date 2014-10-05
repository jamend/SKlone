/****** Object:  User Defined Function dbo.CalcNetworth    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcNetworth
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	DECLARE @Total bigint
	DECLARE @Land bigint
	DECLARE @Buildings bigint
	DECLARE @Tanks bigint
	DECLARE @TFs bigint
	DECLARE @Scis bigint
	DECLARE @LDragoons int
	DECLARE @LTroopers int
	DECLARE @Dragoons int
	DECLARE @Troopers int
	DECLARE @Soldiers int
	DECLARE @SpecialOps int
	DECLARE @Sabres int
	DECLARE @Interceptors int
	DECLARE @Lancers int
	DECLARE @Pop bigint
	DECLARE @Money bigint
	DECLARE @Probes int
	SET @Land = (SELECT Land FROM Land WHERE kdID = @kdID) * 25
	SET @Buildings = (SELECT (SUM(Built) + SUM(Construction0) + SUM(Construction1) + SUM(Construction2) + SUM(Construction3) + SUM(Construction4) + SUM(Construction5) + SUM(Construction6) + SUM(Construction7) + SUM(Construction8) + SUM(Construction9) + SUM(Construction10) + SUM(Construction11) + SUM(Construction12) + SUM(Construction13) + SUM(Construction14) + SUM(Construction15)) * 25 FROM Buildings WHERE kdID = @kdID)
	SET @Soldiers = (SELECT Complete * 3 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 0)
	SET @Troopers = (SELECT Complete * 6 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 1)
	SET @Dragoons = (SELECT Complete * 7 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 2)
	SET @LTroopers = (SELECT Complete * 7 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 3)
	SET @LDragoons = (SELECT Complete * 8 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 4)
	SET @Tanks = (SELECT Complete * 22 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 5)
	SET @TFs = (SELECT Complete * 18 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 6)
	SET @Scis = (SELECT Complete * 8 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 7)
	SET @SpecialOps = (SELECT Complete * 9 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 8)
	SET @Sabres = (SELECT Complete * 8 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 10)
	SET @Interceptors = (SELECT Complete * 9 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 9)
	SET @Lancers = (SELECT Complete * 12 FROM UnitsTraining WHERE kdID = @kdID AND UnitType = 11)
	SET @Pop = (SELECT Population FROM Kingdoms WHERE kdID = @kdID)
	SET @Money = (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) / 500 
	IF (SELECT Probes FROM Kingdoms WHERE kdID = @kdID) = 0
	SET @Probes = 0
	ELSE
	SET @Probes = (SELECT Probes / 1000 FROM Kingdoms WHERE kdID = @kdID)
	SET @Total = (@Land + @Buildings + @Tanks + @TFs + @Scis + @LDragoons + @LTroopers + @Dragoons + @Troopers + @Soldiers + @Pop + @Money + @Probes + @SpecialOps + @Lancers + @Sabres + @Interceptors)
	RETURN(@Total)
END
