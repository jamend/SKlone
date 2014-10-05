/****** Object:  Stored Procedure dbo.ResetAllC    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.ResetAllC
AS
	UPDATE AccountStatus SET Dead = 0, Newbie = 0
	UPDATE Buildings SET Built = 0, Construction0 = 0, Construction1 = 0, Construction2 = 0, Construction3 = 0, Construction4 = 0, Construction5 = 0, Construction6 = 0, Construction7 = 0, Construction8 = 0, Construction9 = 0, Construction10 = 0, Construction11 = 0, Construction12 = 0, Construction13 = 0, Construction14 = 0, Construction15 = 0
	UPDATE Buildings SET Built = 5000 WHERE BuildingType = 0
	UPDATE Buildings SET Built = 10000 WHERE BuildingType = 1
	UPDATE Buildings SET Built = 2500 WHERE BuildingType = 2
	UPDATE Buildings SET Built = 20000 WHERE BuildingType = 4
	UPDATE Buildings SET Built = 5000 WHERE BuildingType = 5
	UPDATE Buildings SET Built = 5000 WHERE BuildingType = 6
	UPDATE Buildings SET Built = 2500 WHERE BuildingType = 7
	UPDATE Research SET Points = 25000000, ResearchPercent = 0, Scientists = 0
	UPDATE UnitsTraining SET Complete = 0, Training0 = 0, Training1 = 0, Training2 = 0, Training3 = 0, Training4 = 0, Training5 = 0, Training6 = 0, Training7 = 0, Training8 = 0, Training9 = 0, Training10 = 0, Training11 = 0, Training12 = 0, Training13 = 0, Training14 = 0, Training15 = 0, Training16 = 0, Training17 = 0, Training18 = 0, Training19 = 0, Training20 = 0, Training21 = 0, Training22 = 0, Training23 = 0
	UPDATE UnitsTraining SET Complete = 1000000 WHERE UnitType = 0
	UPDATE UnitsTraining SET Complete = 200000 WHERE UnitType = 4
	UPDATE UnitsTraining SET Complete = 200000 WHERE UnitType = 5
	UPDATE UnitsTraining SET Complete = 100000 WHERE UnitType = 6
	UPDATE UnitsTraining SET Complete = 100000 WHERE UnitType = 7
	UPDATE Land SET Land = 50000
	UPDATE Kingdoms SET Population = 250000, [Money] = 100000000, [Power] = 7500000, Probes = 0, Income = 0, PowerChange = 0, ShieldsPowerChange = 0, PopulationChange = 0, Networth = dbo.CalcNetworth(kdID)
	UPDATE Shields SET MilitaryPercent = 0, MilitaryUsage = 0, MissilePercent = 0, MissileUsage = 0, PowerUsage = 0
	UPDATE UnitsOut SET [Out] = 0
	UPDATE WLs SET WLOut = 0, WLTime = 0
