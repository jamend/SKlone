/****** Object:  Stored Procedure dbo.ResetKD    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.ResetKD
	(
		@kdID int
	)
AS
	UPDATE AccountStatus SET Dead = 0, Newbie = 1, NewbieHours = 72 WHERE kdID = @kdID
	UPDATE Buildings SET Built = 0, Construction0 = 0, Construction1 = 0, Construction2 = 0, Construction3 = 0, Construction4 = 0, Construction5 = 0, Construction6 = 0, Construction7 = 0, Construction8 = 0, Construction9 = 0, Construction10 = 0, Construction11 = 0, Construction12 = 0, Construction13 = 0, Construction14 = 0, Construction15 = 0 WHERE kdID = @kdID
	UPDATE Buildings SET Built = 80 WHERE BuildingType = 0 AND kdID = @kdID
	UPDATE Buildings SET Built = 5 WHERE BuildingType = 1 AND kdID = @kdID
	UPDATE Buildings SET Built = 40 WHERE BuildingType = 3 AND kdID = @kdID
	UPDATE Buildings SET Built = 10 WHERE BuildingType = 5 AND kdID = @kdID
	UPDATE Research SET Points = 0, ResearchPercent = 0, Scientists = 0 WHERE kdID = @kdID
	UPDATE UnitsTraining SET Complete = 0, Training0 = 0, Training1 = 0, Training2 = 0, Training3 = 0, Training4 = 0, Training5 = 0, Training6 = 0, Training7 = 0, Training8 = 0, Training9 = 0, Training10 = 0, Training11 = 0, Training12 = 0, Training13 = 0, Training14 = 0, Training15 = 0, Training16 = 0, Training17 = 0, Training18 = 0, Training19 = 0, Training20 = 0, Training21 = 0, Training22 = 0, Training23 = 0 WHERE kdID = @kdID
	UPDATE UnitsTraining SET Complete = 200 WHERE UnitType = 0 AND kdID = @kdID
	UPDATE UnitsTraining SET Complete = 10 WHERE UnitType = 7 AND kdID = @kdID
	UPDATE Land SET Land = 250, Land0 = 0, Land1 = 0, Land2 = 0, Land3 = 0, Land4 = 0, Land5 = 0, Land6 = 0, Land7 = 0, Land8 = 0, Land9 = 0, Land10 = 0, Land11 = 0, Land12 = 0, Land13 = 0, Land14 = 0, Land15 = 0, Land16 = 0, Land17 = 0, Land18 = 0, Land19 = 0, Land20 = 0, Land21 = 0, Land22 = 0, Land23 = 0 WHERE kdID = @kdID
	UPDATE Kingdoms SET Wins = 0, Losses = 0, Attacks = 0, LastAttacker = NULL, Population = 2250, [Money] = 175000, [Power] = 500, Probes = 0, Income = 0, PowerChange = 0, ShieldsPowerChange = 0, PopulationChange = 0, Networth = dbo.CalcNetworth(kdID) WHERE kdID = @kdID
	UPDATE Shields SET MilitaryPercent = 0, MilitaryUsage = 0, MissilePercent = 0, MissileUsage = 0, PowerUsage = 0 WHERE kdID = @kdID
	UPDATE UnitsOut SET [Out] = 0 WHERE kdID = @kdID
	UPDATE WLs SET WLOut = 0, WLTime = 0 WHERE kdID = @kdID
