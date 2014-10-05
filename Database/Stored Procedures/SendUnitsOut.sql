/****** Object:  Stored Procedure dbo.SendUnitsOut    Script Date: 5/1/2004 6:12:40 PM ******/
CREATE PROCEDURE dbo.SendUnitsOut
	(
		@kdID int,
		@WLs tinyint,
		@ReturnTime real,
		@Soldiers int,
		@Troopers int,
		@Dragoons int,
		@Tanks int,
		@TFs int,
		@SpecialOps int,
		@Interceptors int,
		@Sabres int,
		@Lancers int
	)
AS
	DECLARE @WL tinyint
	DECLARE @SoldiersInc int
	DECLARE @TroopersInc int
	DECLARE @DragoonsInc int
	DECLARE @TanksInc int
	DECLARE @TFsInc int
	DECLARE @SpecialOpsInc int
	DECLARE @InterceptorsInc int
	DECLARE @SabresInc int
	DECLARE @LancersInc int
	SET @SoldiersInc = @Soldiers / @WLs
	SET @TroopersInc = @Troopers / @WLs
	SET @DragoonsInc = @Dragoons / @WLs
	SET @TanksInc = @Tanks / @WLs
	SET @TFsInc = @TFs / @WLs
	SET @SpecialOpsInc = @SpecialOps / @WLs
	SET @InterceptorsInc = @Interceptors / @WLs
	SET @SabresInc = @Sabres / @WLs
	SET @LancersInc = @Lancers / @WLs
	IF @WLs = 1
	BEGIN
		EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 1
		UPDATE UnitsOut SET [Out] = @Soldiers WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Troopers WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Dragoons WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Tanks WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @TFs WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @SpecialOps WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Interceptors WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Sabres WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
		UPDATE UnitsOut SET [Out] = @Lancers WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
	END
	ELSE
	BEGIN
		DECLARE @SoldiersRest tinyint
		DECLARE @TroopersRest tinyint
		DECLARE @DragoonsRest tinyint
		DECLARE @TanksRest tinyint
		DECLARE @TFsRest tinyint
		DECLARE @SpecialOpsRest tinyint
		DECLARE @InterceptorsRest tinyint
		DECLARE @SabresRest tinyint
		DECLARE @LancersRest tinyint
		SET @SoldiersRest = @Soldiers % @WLs
		SET @TroopersRest = @Troopers % @WLs
		SET @DragoonsRest = @Dragoons % @WLs
		SET @TanksRest = @Tanks % @WLs
		SET @TFsRest = @TFs % @WLs
		SET @SpecialOpsRest = @SpecialOps % @WLs
		SET @InterceptorsRest = @Interceptors % @WLs
		SET @SabresRest = @Sabres % @WLs
		SET @LancersRest = @Lancers % @WLs
		IF @WLs = 2
		BEGIN
			EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 1
			UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
			EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.5
			UPDATE UnitsOut SET [Out] = @SoldiersInc + @SoldiersRest WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TroopersInc + @TroopersRest WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @DragoonsInc + @DragoonsRest WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TanksInc + @TanksRest WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @TFsInc + @TFsRest WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @SpecialOpsInc + @SpecialOpsRest WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @InterceptorsInc + @InterceptorsRest WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @SabresInc + @SabresRest WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
			UPDATE UnitsOut SET [Out] = @LancersInc + @LancersRest WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
		END
		ELSE
		BEGIN
			IF @WLs = 3
			BEGIN
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 1
				UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.667
				UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.333
				UPDATE UnitsOut SET [Out] = @SoldiersInc + @SoldiersRest WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc + @TroopersRest WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc + @DragoonsRest WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc + @TanksRest WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc + @TFsRest WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc + @SpecialOpsRest WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc + @InterceptorsRest WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc + @SabresRest WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc + @LancersRest WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
			END
			ELSE
			BEGIN
				IF @WLs = 4
				BEGIN
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 1
				UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.75
				UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
					EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.5
				UPDATE UnitsOut SET [Out] = @SoldiersInc WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
				EXEC @WL = dbo.SetWLOut @kdID, @ReturnTime, 0.25
				UPDATE UnitsOut SET [Out] = @SoldiersInc + @SoldiersRest WHERE UnitType = 0 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TroopersInc + @TroopersRest WHERE UnitType = 1 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @DragoonsInc + @DragoonsRest WHERE UnitType = 2 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TanksInc + @TanksRest WHERE UnitType = 5 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @TFsInc + @TFsRest WHERE UnitType = 6 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SpecialOpsInc + @SpecialOpsRest WHERE UnitType = 8 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @InterceptorsInc + @InterceptorsRest WHERE UnitType = 9 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @SabresInc + @SabresRest WHERE UnitType = 10 AND WLID = @WL AND kdID = @kdID
				UPDATE UnitsOut SET [Out] = @LancersInc + @LancersRest WHERE UnitType = 11 AND WLID = @WL AND kdID = @kdID
				END
			END
		END
	END
