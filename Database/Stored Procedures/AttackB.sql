/****** Object:  Stored Procedure dbo.AttackB    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE PROCEDURE dbo.AttackB
	(
		@Attacker int,
		@Defender int,
		@WLs tinyint,
		@Soldiers int,
		@Troopers int,
		@Dragoons int,
		@Tanks int,
		@TFs int,
		@SpecialOps int,
		@Interceptors int,
		@Sabres int,
		@Lancers int,
		@SKDate nvarchar(24),
		@Result nvarchar(600) output
	)
AS
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	DECLARE @AttackerAlliance int
	DECLARE @DefenderAlliance int
	DECLARE @DefenderNewbie int
	DECLARE @DefenderVacation int
	DECLARE @AttackerVacation int
	DECLARE @Sector1 int
	DECLARE @Sector2 int
	DECLARE @AttackerDead int
	SET @AttackerDead = (SELECT Dead FROM AccountStatus WHERE kdID = @Attacker)
	SET @DefenderVacation = (SELECT Vacation FROM AccountStatus WHERE kdID = @Defender)
	SET @AttackerVacation = (SELECT Vacation FROM AccountStatus WHERE kdID = @Attacker)
	SET @DefenderNewbie = (SELECT Newbie FROM AccountStatus WHERE kdID = @Defender)
	SET @Sector1 = @AttackerSector
	SET @Sector2 = @DefenderSector
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @AttackerAlliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @AttackerSector)
	SET @DefenderAlliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @DefenderSector)
	IF @AttackerDead = 1
	BEGIN
		SET @Result = 'Your not able to attack when your dead.'
	END
	ELSE
	IF @DefenderNewbie = 1
	BEGIN
		SET @Result = 'The kingdom you are trying to attack is in newbie mode.'
	END
	ELSE
	IF @DefenderVacation = 1
	BEGIN
		SET @Result = 'The kingdom you are trying to attack is in vacation mode.'
	END
	ELSE
	IF @AttackerVacation = 1
	BEGIN
		SET @Result = 'You must leave vacation mode before attacking.'
	END
	ELSE
	IF dbo.AllianceRelation(@Sector1, @Sector2) = 4
	BEGIN
		SET @Result = '0' /* nap */
	END
	ELSE
	BEGIN
		IF (SELECT COUNT(WLOut) From WLs WHERE WLOut = 0 AND kdID = @Attacker) < @WLs
		BEGIN
			SET @Result = '1' /* not enough wls */
		END
		ELSE
		BEGIN
			IF dbo.UnitsHome(@Attacker, 0) < @Soldiers OR dbo.UnitsHome(@Attacker, 1) < @Troopers OR dbo.UnitsHome(@Attacker, 2) < @Dragoons OR dbo.UnitsHome(@Attacker, 5) < @Tanks OR dbo.TFsHome(@Attacker) < @TFs OR dbo.UnitsHome(@Attacker, 8) < @SpecialOps OR dbo.UnitsHome(@Attacker, 9) < @Interceptors OR dbo.UnitsHome(@Attacker, 10) < @Sabres OR dbo.UnitsHome(@Attacker, 11) < @Lancers
			BEGIN
				SET @Result = '2' /* not enough units */
			END
			ELSE
			BEGIN
				IF (SELECT Newbie FROM AccountStatus WHERE kdID = @Defender) = 1
				BEGIN
					SET @Result = '3' /* newbie */
				END
				ELSE
				BEGIN
					IF (SELECT Dead FROM AccountStatus WHERE kdID = @Defender) = 1
					BEGIN
						SET @Result = '4' /* dead */
					END
					ELSE
					BEGIN
						DECLARE @AttackPower bigint
						DECLARE @DefencePower bigint
						SET @AttackPower = dbo.CalcAttackPower(@Attacker, @Defender, @WLs, @Soldiers, @Troopers, @Dragoons, @Tanks, @TFs, @SpecialOps, @Interceptors, @Sabres, @Lancers)
						SET @DefencePower = dbo.CalcDefencePower(@Attacker, @Defender)
						print @AttackPower
						print @DefencePower
						IF @DefencePower = 0
						BEGIN
						SET @DefencePower = 1
						END
						
						DECLARE @DefenderLoss real
						IF @AttackPower > 0
						BEGIN
							SET @DefenderLoss = 0.075 / (CAST(@DefencePower AS real) / @AttackPower)
						END
						ELSE
						BEGIN
							SET @DefenderLoss = 0
						END
						DECLARE @SoldiersLostA int
						DECLARE @SoldiersLostB int
						DECLARE @TroopersLostA int
						DECLARE @LTroopersLostB int
						DECLARE @DragoonsLostA int
						DECLARE @LDragoonsLostB int
						DECLARE @TanksLostA int
						DECLARE @TanksLostB int
						DECLARE @TFsLostA int
						DECLARE @TFsLostB int
						DECLARE @SpecialOpsLostA int
						DECLARE @SpecialOpsLostB int
						DECLARE @InterceptorsLostA int
						DECLARE @InterceptorsLostB int
						DECLARE @SabresLostA int
						DECLARE @SabresLostB int
						DECLARE @LancersLostA int
						DECLARE @LancersLostB int
						SET @SoldiersLostA = @Soldiers * 0.08
						SET @SoldiersLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 0)
						SET @TroopersLostA = @Troopers * 0.08
						SET @LTroopersLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 3)
						SET @DragoonsLostA = @Dragoons * 0.08
						SET @LDragoonsLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 4)
						SET @TanksLostA = @Tanks * 0.08
						SET @TanksLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 5)
						SET @TFsLostA = @TFs * 0.08
						SET @TFsLostB = @DefenderLoss * dbo.TFsHome(@Defender)
						SET @SpecialOpsLostA = @SpecialOps * 0.08
						SET @SpecialOpsLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 8)
						SET @InterceptorsLostA = @Interceptors * 0.08
						SET @InterceptorsLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 9)
						SET @SabresLostA = @Sabres * 0.08
						SET @SabresLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 10)
						SET @LancersLostA = @Lancers * 0.08
						SET @LancersLostB = @DefenderLoss * dbo.UnitsHome(@Defender, 11)
						IF @SoldiersLostB = NULL 
						BEGIN
							SET @SoldiersLostB = 0
						END
						IF @LTroopersLostB = NULL 
						BEGIN
							SET @LTroopersLostB = 0
						END
						IF @LDragoonsLostB = NULL 
						BEGIN
							SET @LDragoonsLostB = 0
						END
						IF @TanksLostB = NULL 
						BEGIN
							SET @TanksLostB = 0
						END
						IF @TFsLostB = NULL 
						BEGIN
							SET @TFsLostB = 0
						END
						IF @SpecialOpsLostB = NULL 
						BEGIN
							SET @SpecialOpsLostB = 0
						END
						IF @InterceptorsLostB = NULL 
						BEGIN
							SET @InterceptorsLostB = 0
						END
						IF @SabresLostB = NULL 
						BEGIN
							SET @SabresLostB = 0
						END
						IF @LancersLostB = NULL 
						BEGIN
							SET @LancersLostB = 0
						END
						UPDATE UnitsTraining SET Complete = Complete - @SoldiersLostA WHERE kdID = @Attacker AND UnitType = 0
						UPDATE UnitsTraining SET Complete = Complete - @TroopersLostA WHERE kdID = @Attacker AND UnitType = 1
						UPDATE UnitsTraining SET Complete = Complete - @DragoonsLostA WHERE kdID = @Attacker AND UnitType = 2
						UPDATE UnitsTraining SET Complete = Complete - @TanksLostA WHERE kdID = @Attacker AND UnitType = 5
						UPDATE UnitsTraining SET Complete = Complete - @TFsLostA WHERE kdID = @Attacker AND UnitType = 6
						UPDATE UnitsTraining SET Complete = Complete - @SpecialOpsLostA WHERE kdID = @Attacker AND UnitType = 8
						UPDATE UnitsTraining SET Complete = Complete - @InterceptorsLostA WHERE kdID = @Attacker AND UnitType = 9
						UPDATE UnitsTraining SET Complete = Complete - @SabresLostA WHERE kdID = @Attacker AND UnitType = 10
						UPDATE UnitsTraining SET Complete = Complete - @LancersLostA WHERE kdID = @Attacker AND UnitType = 11
						UPDATE UnitsTraining SET Complete = Complete - @SoldiersLostB WHERE kdID = @Defender AND UnitType = 0
						UPDATE UnitsTraining SET Complete = Complete - @LTroopersLostB WHERE kdID = @Defender AND UnitType = 3
						UPDATE UnitsTraining SET Complete = Complete - @LDragoonsLostB WHERE kdID = @Defender AND UnitType = 4
						UPDATE UnitsTraining SET Complete = Complete - @TanksLostB WHERE kdID = @Defender AND UnitType = 5
						UPDATE UnitsTraining SET Complete = Complete - @TFsLostB WHERE kdID = @Defender AND UnitType = 6
						UPDATE UnitsTraining SET Complete = Complete - @SpecialOpsLostB WHERE kdID = @Defender AND UnitType = 8
						UPDATE UnitsTraining SET Complete = Complete - @InterceptorsLostB WHERE kdID = @Defender AND UnitType = 9
						UPDATE UnitsTraining SET Complete = Complete - @SabresLostB WHERE kdID = @Defender AND UnitType = 10
						UPDATE UnitsTraining SET Complete = Complete - @LancersLostB WHERE kdID = @Defender AND UnitType = 11
						DECLARE @ReturnTime tinyint
						DECLARE @NewSoldiers int
						DECLARE @NewTroopers int
						DECLARE @NewDragoons int
						DECLARE @NewTanks int
						DECLARE @NewTFs int
						DECLARE @NewSpecialOps int
						DECLARE @NewInterceptors int
						DECLARE @NewSabres int
						DECLARE @NewLancers int
						SET @NewSoldiers = @Soldiers - @SoldiersLostA
						SET @NewTroopers = @Troopers - @TroopersLostA
						SET @NewDragoons = @Dragoons - @DragoonsLostA
						SET @NewTanks = @Tanks - @TanksLostA
						SET @NewTFs = @TFs - @TFsLostA
						SET @NewSpecialOps = @SpecialOps - @SpecialOpsLostA
						SET @NewInterceptors = @Interceptors - @InterceptorsLostA
						SET @NewSabres = @Sabres - @SabresLostA
						SET @NewLancers = @Lancers - @LancersLostA
						SET @ReturnTime = dbo.CalcReturnTime(@Attacker, @Defender)
						EXEC dbo.SendUnitsOut @Attacker, @WLs, @ReturnTime, @NewSoldiers, @NewTroopers, @NewDragoons, @NewTanks, @NewTFs, @NewSpecialOps, @NewInterceptors, @NewSabres, @NewLancers
						UPDATE Kingdoms SET LastAttacker = @Attacker WHERE kdID = @Defender
						DECLARE @AttackerName nvarchar(48)
						DECLARE @DefenderName nvarchar(48)
						SET @AttackerName = dbo.FullKingdomNameC(@Attacker)
						SET @DefenderName = dbo.FullKingdomNameC(@Defender)
						DECLARE @AttackerSectorNews nvarchar(512)
						DECLARE @DefenderSectorNews nvarchar(512)
						DECLARE @PersonalNews nvarchar(512)
						IF @AttackPower < @DefencePower
						BEGIN
							/* fail */
							SET @AttackerSectorNews = 'On ' + @SKDate + ', our brave kingdom ' + @AttackerName + ' attacked ' + @DefenderName + ' and <b>failed</b> miserably.'
							SET @DefenderSectorNews = 'On ' + @SKDate + ', our kingdom ' + @DefenderName + ' bravely defended against ' + @AttackerName + ' and was <b>victorious</b>!'
							SET @PersonalNews = 'Forces from ' + @AttackerName + ' have invaded our lands. Our troops <b>successfuly</b> defended our lands.<br>'
							SET @Result = 'The battle begins quickly. Our leaders have reported that our attack was <b>unsuccessful</b>.<br>'
						END
						ELSE
						BEGIN
							/* success */
							DECLARE @LandGain int
							DECLARE @LandLoss int
							DECLARE @PopulationGain bigint
							DECLARE @PowerGain bigint
							DECLARE @MoneyGain bigint
							SET @LandGain = dbo.LandGain(@Attacker, @Defender)
							SET @LandLoss = dbo.LandGain(@Attacker, @Defender)
							SET @PopulationGain = (SELECT Population FROM Kingdoms WHERE kdID = @Defender) * 0.1 * (SELECT AttackGainBonus FROM AllianceRelationTypes WHERE RelationType = dbo.AllianceRelation(@AttackerSector, @DefenderSector))
							SET @PowerGain = (SELECT [Power] FROM Kingdoms WHERE kdID = @Defender) * 0.1 * (SELECT AttackGainBonus FROM AllianceRelationTypes WHERE RelationType = dbo.AllianceRelation(@AttackerSector, @DefenderSector))
							SET @MoneyGain = (SELECT [Money] FROM Kingdoms WHERE kdID = @Defender) * 0.1 * (SELECT AttackGainBonus FROM AllianceRelationTypes WHERE RelationType = dbo.AllianceRelation(@AttackerSector, @DefenderSector))
							EXEC dbo.BuildingLoss @Attacker, @Defender
							UPDATE Land SET Land = Land + @LandGain WHERE kdID = @Attacker
							UPDATE Land SET Land = Land - @LandGain WHERE kdID = @Defender
							UPDATE Kingdoms SET Population = Population + @PopulationGain, [Power] = [Power] + @PowerGain, [Money] = [Money] + @MoneyGain WHERE kdID = @Attacker
							UPDATE Kingdoms SET Population = Population - @PopulationGain, [Power] = [Power] - @PowerGain, [Money] = [Money] - @MoneyGain WHERE kdID = @Defender
							IF (SELECT Land FROM Land WHERE kdID = @Defender) = 0 
							BEGIN
							UPDATE AccountStatus SET Dead = 1, DieDate = GETDATE() WHERE kdID = @Defender 
							UPDATE Scores SET Kills = Kills + 1 WHERE kdID = @Attacker
							END
							IF (SELECT Population FROM Kingdoms WHERE kdID = @Defender) <= 0 UPDATE AccountStatus SET Dead = 1, DieDate = GETDATE() WHERE kdID = @Defender
							SET @AttackerSectorNews = 'On ' + @SKDate + ', our brave kingdom ' + @AttackerName + ' attacked ' + @DefenderName + ' and conquered <b>' + dbo.FormatNumber(@LandGain) + '</b> land.'
							SET @DefenderSectorNews = 'On ' + @SKDate + ', our kingdom ' + @DefenderName + ' bravely defended against ' + @AttackerName + ' and lost <b>' + dbo.FormatNumber(@LandGain) + '</b> land.'
							SET @PersonalNews = 'Forces from ' + @AttackerName + ' have invaded our lands. Our troops <b>unsuccessfuly</b> defended our lands and we have lost <b>' + dbo.FormatNumber(@LandGain) + '</b> land, <b>' + dbo.FormatNumber(@MoneyGain) + '</b> money, <b>' + dbo.FormatNumber(@PopulationGain) + '</b> population, and <b>' + dbo.FormatNumber(@PowerGain) + '</b> power.<br>'
							SET @Result = 'The battle begins quickly. Our leaders have reported that our attack was <b>successful</b>!<br>We have conquered: <b>' + dbo.FormatNumber(@LandGain) + '</b> land, <b>' + dbo.FormatNumber(@MoneyGain) + '</b> money, <b>' + dbo.FormatNumber(@PopulationGain) + '</b> population, and <b>' + dbo.FormatNumber(@PowerGain) + '</b> power.<br>'
							IF @LandGain > (SELECT LargestGrab FROM Scores WHERE kdID = @Attacker)
							BEGIN
								UPDATE Scores SET LargestGrab = @LandGain WHERE kdID = @Attacker
							END
							UPDATE Scores SET LandFromAttacks = LandFromAttacks + @landGain WHERE kdID = @Attacker
							UPDATE Kingdoms SET Wins = Wins + 1 WHERE kdID = @Attacker
							UPDATE Kingdoms SET Losses = Losses + 1 WHERE kdID = @Defender
						END
						IF @AttackerSector = @DefenderSector
						BEGIN
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@AttackerSector, 2, @AttackerSectorNews)
							IF @AttackerAlliance != 0 INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@AttackerAlliance, 2, @AttackerSectorNews)
						END
						ELSE
						BEGIN
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@AttackerSector, 0, @AttackerSectorNews)
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@DefenderSector, 1, @DefenderSectorNews)
							IF dbo.AllianceRelation(@AttackerAlliance, @DefenderAlliance) = 2
							BEGIN
								INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@AttackerAlliance, 0, @AttackerSectorNews)
								INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@DefenderAlliance, 1, @DefenderSectorNews)
							END
						END
						SET @PersonalNews = @PersonalNews + 'We have lost <b>' + dbo.FormatNumber(@SoldiersLostB) + '</b> soldiers, <b>' + dbo.FormatNumber(@LTroopersLostB) + '</b> laser troopers, '
						IF dbo.UnitResearched(@Defender, 4) = 1 SET @PersonalNews = @PersonalNews + '<b>' + dbo.FormatNumber(@LDragoonsLostB) + '</b> laser dragoons, '
						IF dbo.UnitResearched(@Defender, 6) = 1 SET @PersonalNews = @PersonalNews + '<b>' + dbo.FormatNumber(@TFsLostB) + '</b> tactical fighters, '
						IF dbo.UnitResearched(@Defender, 9) = 1 SET @PersonalNews = @PersonalNews + '<b>' + dbo.FormatNumber(@InterceptorsLostB) + '</b> interceptors, '
						IF dbo.UnitResearched(@Defender, 10) = 1 SET @PersonalNews = @PersonalNews + '<b>' + dbo.FormatNumber(@SabresLostB) + '</b> sabres, '
						IF dbo.UnitResearched(@Defender, 11) = 1 SET @PersonalNews = @PersonalNews + '<b>' + dbo.FormatNumber(@TFsLostB) + '</b> high guard lancers, '
						SET @PersonalNews = @PersonalNews + 'and <b>' + dbo.FormatNumber(@TanksLostB) + '</b> tanks.'
						INSERT INTO PersonalNews(kdID, NewsText) VALUES (@Defender, @PersonalNews)
						UPDATE Kingdoms SET Attacks = Attacks + 4 WHERE kdID = @Defender
						IF (SELECT Attacks FROM Kingdoms WHERE kdID = @Defender) > 12
						BEGIN
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@DefenderSector, 3, 'Our kingdom ' + @DefenderName + ' has entered trouble mode. Aid will be accepted for 12 hours.')
							UPDATE Kingdoms SET TroubleMode = 1 WHERE kdID = @Defender AND TroubleMode = 0
						END
						SET @Result = @Result + 'We have lost <b>' + dbo.FormatNumber(@SoldiersLostA) + '</b> soldiers, <b>' + dbo.FormatNumber(@TroopersLostA) + '</b> troopers, <b>' + dbo.FormatNumber(@SpecialOpsLostA) + '</b> special ops, '
						IF dbo.UnitResearched(@Attacker, 2) = 1 SET @Result = @Result + '<b>' + dbo.FormatNumber(@DragoonsLostA) + '</b> dragoons, '
						IF dbo.UnitResearched(@Attacker, 6) = 1 SET @Result = @Result + '<b>' + dbo.FormatNumber(@TFsLostA) + '</b> tactical fighters, '
						IF dbo.UnitResearched(@Attacker, 9) = 1 SET @Result = @Result + '<b>' + dbo.FormatNumber(@InterceptorsLostA) + '</b> interceptors, '
						IF dbo.UnitResearched(@Attacker, 10) = 1 SET @Result = @Result + '<b>' + dbo.FormatNumber(@SabresLostA) + '</b> sabres, '
						IF dbo.UnitResearched(@Attacker, 11) = 1 SET @Result = @Result + '<b>' + dbo.FormatNumber(@LancersLostA) + '</b> high guard lancers, '
						SET @Result = @Result + 'and <b>' + dbo.FormatNumber(@TanksLostA) + '</b> tanks. We have killed about <b>' + dbo.FormatNumber(ROUND(@SoldiersLostB + @LTroopersLostB + @LDragoonsLostB + @TanksLostB + @TFsLostB + @SabresLostB + @SpecialOpsLostB + @LancersLostB + @InterceptorsLostB, -1)) + '</b> enemy military units.<br>Our attacking troops will take <b>' + dbo.FormatNumber(@ReturnTime) + '</b> hours to return home.'
						print @Result
					END
				END
			END
		END
	END
