/****** Object:  Stored Procedure dbo.BackupTick    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.BackupTick AS
	/* advance land exlporation */
	UPDATE Land SET
		Land = (Land + Land0),
		Land0 = Land1,
		Land1 = Land2,
		Land2 = Land3,
		Land3 = Land4,
		Land4 = Land5,
		Land5 = Land6,
		Land6 = Land7,
		Land7 = Land8,
		Land8 = Land9,
		Land9 = Land10,
		Land10 = Land11,
		Land11 = Land12,
		Land12 = Land13,
		Land13 = Land14,
		Land14 = Land15,
		Land15 = Land16,
		Land16 = Land17,
		Land17 = Land18,
		Land18 = Land19,
		Land19 = Land20,
		Land20 = Land21,
		Land21 = Land22,
		Land22 = Land23,
		Land23 = 0
	WHERE dbo.IsDead(kdID) = 0
	/* advance building construction */
	UPDATE Buildings SET
		Built = (Built + Construction0),
		Construction0 = Construction1,
		Construction1 = Construction2,
		Construction2 = Construction3,
		Construction3 = Construction4,
		Construction4 = Construction5,
		Construction5 = Construction6,
		Construction6 = Construction7,
		Construction7 = Construction8,
		Construction8 = Construction9,
		Construction9 = Construction10,
		Construction10 = Construction11,
		Construction11 = Construction12,
		Construction12 = Construction13,
		Construction13 = Construction14,
		Construction14 = Construction15,
		Construction15 = 0
	WHERE dbo.IsDead(kdID) = 0
	/* advance unit training */
	UPDATE UnitsTraining SET
		Complete = (Complete + Training0),
		Training0 = Training1,
		Training1 = Training2,
		Training2 = Training3,
		Training3 = Training4,
		Training4 = Training5,
		Training5 = Training6,
		Training6 = Training7,
		Training7 = Training8,
		Training8 = Training9,
		Training9 = Training10,
		Training10 = Training11,
		Training11 = Training12,
		Training12 = Training13,
		Training13 = Training14,
		Training14 = Training15,
		Training15 = Training16,
		Training16 = Training17,
		Training17 = Training18,
		Training18 = Training19,
		Training19 = Training20,
		Training20 = Training21,
		Training21 = Training22,
		Training22 = Training23,
		Training23 = 0
	WHERE dbo.IsDead(kdID) = 0
	/* calculate research */
	UPDATE Research SET Points = Points + Scientists WHERE dbo.IsDead(kdID) = 0
	UPDATE Research SET ResearchPercent = dbo.CalcResearchPercent(kdID, ResearchType) WHERE dbo.IsDead(kdID) = 0
	/* update nuke construction */
	UPDATE Missiles SET NuclearTime = NuclearTime - 1 WHERE NuclearBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Nuclear = 1, NuclearBuilding = 0 WHERE NuclearBuilding = 1 AND NuclearTime = 0 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET FusionTime = FusionTime - 1 WHERE FusionBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Fusion = 1, FusionBuilding = 0 WHERE FusionBuilding = 1 AND FusionTime = 0 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET EnergyTime = EnergyTime - 1 WHERE EnergyBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Energy = 1, EnergyBuilding = 0 WHERE EnergyBuilding = 1 AND EnergyTime = 0 AND dbo.IsDead(kdID) = 0
	/* increase probe turns */
	UPDATE Kingdoms SET ProbeTurns = ProbeTurns + 1 WHERE ProbeTurns < 10 AND dbo.IsDead(kdID) = 0
	/* increase probes */
	UPDATE Kingdoms SET Probes = Kingdoms.Probes + Buildings.Built * ((SELECT ProbeFactor FROM PlanetTypes WHERE PlanetType = Kingdoms.PlanetType) + (SELECT ProbeFactor FROM RaceTypes WHERE RaceType = Kingdoms.RaceType)) * (0.5 + (RAND() / 2)) FROM Kingdoms, Buildings WHERE Buildings.kdID = Kingdoms.kdID AND Buildings.BuildingType = 7 AND dbo.IsDead(Kingdoms.kdID) = 0
	/*Decease Alliance Wait*/
	UPDATE Sectors SET AllianceWait = AllianceWait - 1 WHERE AllianceWait > 0
	/*Decease War Status*/
	UPDATE Alliances SET WarStatus = WarStatus - 1 WHERE WarStatus > 0
	UPDATE Alliances SET WarStatus = NULL WHERE WarStatus = 0
	
	
	/* calculate power */
	UPDATE Kingdoms SET PowerChange = dbo.NewPower(kdID) - [Power] WHERE dbo.IsDead(kdID) = 0
	UPDATE Kingdoms SET [Power] = [Power] + PowerChange WHERE dbo.IsDead(kdID) = 0
	/* increase money */
	UPDATE Kingdoms SET Income = ((Buildings.Built * 120) + (Kingdoms.Population * (2.2 + RAND()))) * (SELECT IncomeFactor FROM PlanetTypes WHERE PlanetType = Kingdoms.PlanetType) FROM Kingdoms, Buildings WHERE Kingdoms.kdID = Buildings.kdID AND Buildings.BuildingType = 5 AND dbo.IsDead(Kingdoms.kdID) = 0
	UPDATE Kingdoms SET [Money] = [Money] + Income WHERE dbo.IsDead(kdID) = 0 AND [Money] < 2000000000000
	/* increase population */
	UPDATE Kingdoms SET PopulationChange = dbo.PopulationChange(kdID) WHERE dbo.IsDead(kdID) = 0
	UPDATE Kingdoms SET Population = Population + PopulationChange WHERE dbo.IsDead(kdID) = 0
	/* return war leaders */
	
	UPDATE WLS SET WLTime = WLTime - 1 WHERE WLOut = 1 AND dbo.IsDead(kdID) = 0
	UPDATE WLs SET WLOut = 0 WHERE WLOut = 1 AND WLTime = 0 AND dbo.IsDead(kdID) = 0
	UPDATE UnitsOut SET UnitsOut.[Out] = 0 FROM UnitsOut, WLs WHERE WLs.kdID = UnitsOut.kdID AND WLs.WLOut = 0 AND WLs.WLID = UnitsOut.WLID AND dbo.IsDead(UnitsOut.kdID) = 0
	/* decrease ma% */
	UPDATE Kingdoms SET MA = MA - 5 WHERE MA > 0 AND dbo.IsDead(kdID) = 0
	/* decrease attack count */
	UPDATE Kingdoms SET Attacks = Attacks - 1 WHERE Attacks > 0 AND dbo.IsDead(kdID) = 0
	/* disable trouble mode */
	UPDATE Kingdoms SET TroubleMode = 0 WHERE Attacks < 3 AND dbo.IsDead(kdID) = 0
	/* reset messages sent */
	UPDATE AccountStatus SET MessagesSent = 0 WHERE dbo.IsDead(kdID) = 0
	/* update inactive status */
	UPDATE AccountStatus SET Inactive = 1 FROM AccountStatus WHERE (SELECT TOP 1 LogInDate FROM LogIns WHERE kdID = AccountStatus.kdID ORDER BY LogInDate DESC) < DATEADD(hour, -48, GETDATE()) AND dbo.IsDead(kdID) = 0
	/* update networth */
	UPDATE Kingdoms SET Networth = dbo.CalcNetworth(kdID) WHERE dbo.IsDead(kdID) = 0
	/*delete kingdoms*/
	UPDATE AccountStatus SET DeleteDate = 1 WHERE LoggedIn = 1 AND Dead = 1
	UPDATE AccountStatus SET DeleteDate = 1 WHERE DeleteDate <= 0
	UPDATE AccountStatus SET DeleteDate = 12 WHERE Dead = 1 AND DeleteDate IS NULL
	UPDATE AccountStatus SET DeleteDate = 12 WHERE DeletePending = 1 AND DeleteDate IS NULL
	UPDATE AccountStatus SET DeleteDate = DeleteDate - 1 WHERE Dead = 1
	UPDATE AccountStatus SET DeleteDate = DeleteDate - 1 WHERE DeletePending = 1
	EXEC dbo.cleanup
	/* kill kingdoms with no pop */
	UPDATE AccountStatus SET AccountStatus.Dead = 1, AccountStatus.DieDate = GETDATE() FROM AccountStatus, Kingdoms WHERE AccountStatus.kdID = Kingdoms.kdID AND AccountStatus.Dead = 0 AND Kingdoms.Population <= 0
	/* update newbie status */
	UPDATE AccountStatus SET NewbieHours = NewbieHours - 1 WHERE Newbie = 1 AND dbo.IsDead(kdID) = 0
	UPDATE AccountStatus SET Newbie = 0 WHERE Newbie = 1 AND NewbieHours = 0 AND dbo.IsDead(kdID) = 0
	/* update vacation status */
	
	UPDATE AccountStatus SET VacationStart = VacationStart - 1 WHERE VacationPending = 1 AND dbo.IsDead(kdID) = 0
	UPDATE AccountStatus SET Vacation = 1, VacationPending = 0 WHERE VacationStart = 0 AND VacationPending = 1 AND dbo.IsDead(kdID) = 0
	UPDATE AccountStatus SET VacationMode = VacationMode -1 WHERE VacationStart = 0 AND Vacation = 1 AND dbo.IsDead(kdID) = 0
	UPDATE AccountStatus SET VacationEnd = VacationEnd - 1 WHERE VacationPending = 0 AND VacationMode = 0 AND Vacation = 1 AND dbo.IsDead(kdID) = 0
	UPDATE AccountStatus SET Vacation = 0 WHERE Vacation = 1 AND VacationEnd = 0 AND dbo.IsDead(kdID) = 0
	/* calculate shields */
	UPDATE Shields SET Shields.PowerUsage = 0, Shields.MilitaryPercent = 0, Shields.MissilePercent = 0 FROM Shields, Kingdoms WHERE Kingdoms.kdID = Shields.kdID AND ((Shields.MilitaryUsage * Shields.PowerUsage) / 100 > Kingdoms.[Power] OR (Shields.MissileUsage * Shields.PowerUsage) / 100 > Kingdoms.[Power]) AND dbo.IsDead(Shields.kdID) = 0
	UPDATE Shields SET Shields.MilitaryPercent = ((Shields.MilitaryUsage * Shields.PowerUsage / 10) / Land.Land * 2.5375) FROM Shields, Land WHERE Land.kdID = Shields.kdID AND dbo.IsDead(Shields.kdID) = 0 AND Shields.PowerUsage != 0
	UPDATE Shields SET Shields.MissilePercent = ((Shields.MissileUsage * Shields.PowerUsage / 10) / Land.Land * 1.8375) FROM Shields, Land WHERE Land.kdID = Shields.kdID AND dbo.IsDead(Shields.kdID) = 0 AND Shields.PowerUsage != 0
	UPDATE Kingdoms SET Kingdoms.[Power] = Kingdoms.[Power] - Shields.PowerUsage FROM Kingdoms, Shields WHERE Kingdoms.kdID = Shields.kdID AND dbo.IsDead(Kingdoms.kdID) = 0
	UPDATE Kingdoms SET Kingdoms.ShieldsPowerChange = Kingdoms.PowerChange - Shields.PowerUsage FROM Kingdoms, Shields WHERE Kingdoms.kdID = Shields.kdID AND dbo.IsDead(Kingdoms.kdID) = 0
	/* clear 3 day old unread messages */
	DELETE FROM Messages WHERE MessageRead = 1 AND DateSent < DATEADD(day, -3, GETDATE())
	/* update alliances networth */
	UPDATE Alliances SET Rank = 0
	CREATE TABLE #Temp(Rank int IDENTITY(1, 1), AllianceID int)
	UPDATE Alliances SET Networth = dbo.AllianceNetworth(AllianceID), AverageNetworth = dbo.AllianceAverageNetworth(AllianceID)
	INSERT INTO #Temp(AllianceID) SELECT TOP 100 AllianceID FROM Alliances ORDER BY Networth DESC
	UPDATE Alliances SET Alliances.Rank = #Temp.Rank FROM #Temp, Alliances WHERE #Temp.AllianceID = Alliances.AllianceID 
	/* clear old news */
	DELETE FROM SectorNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM AllianceNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM UniversalNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM PersonalNews WHERE NewsDate = DATEADD(day, -3, GETDATE()) AND NewsRead = 1
