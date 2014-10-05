/****** Object:  Stored Procedure dbo.CreateFarms    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.CreateFarms
	(
		@IP nvarchar(16),
		@ActivationCode bigint,
		@Account nvarchar(16),
		@Password nvarchar(16),
		@Email nvarchar(256),
		@KingdomName nvarchar(24),
		@RulerName nvarchar(24),
		@PlanetType tinyint,
		@RaceType tinyint
	)
AS
	DECLARE @Result int
					BEGIN
						DECLARE @kdID int
						INSERT INTO Accounts(Account, [Password], Email) VALUES (@Account, @Password, @Email)
						SET @kdID = @@IDENTITY
					DECLARE @SectorID int
					CREATE TABLE #Temp(SectorIndex int IDENTITY(1, 1), SectorID int)
					INSERT INTO #Temp(SectorID) SELECT SectorID FROM Sectors WHERE dbo.KingdomCount(SectorID) < 20
					SET @SectorID = (SELECT SectorID FROM Sectors WHERE Galaxy = 2 AND Sector = 1)
						INSERT INTO Kingdoms(kdID, [Name], RulerName, RaceType, PlanetType, SectorID) VALUES (@kdID, @KingdomName, @RulerName, @RaceType, @PlanetType, @SectorID)
						
						INSERT INTO Buildings(kdID, BuildingType, Built) VALUES (@kdID, 0, 80)
						INSERT INTO Buildings(kdID, BuildingType, Built) VALUES (@kdID, 1, 5)
						INSERT INTO Buildings(kdID, BuildingType) VALUES (@kdID, 2)
						INSERT INTO Buildings(kdID, BuildingType, Built) VALUES (@kdID, 3, 40)
						INSERT INTO Buildings(kdID, BuildingType) VALUES (@kdID, 4)
						INSERT INTO Buildings(kdID, BuildingType, Built) VALUES (@kdID, 5, 10)
						INSERT INTO Buildings(kdID, BuildingType) VALUES (@kdID, 6)
						INSERT INTO Buildings(kdID, BuildingType) VALUES (@kdID, 7)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 0)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 1)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 2)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 3)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 4)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 5)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 6)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 7)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 8)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 9)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 10)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 11)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 12)
						INSERT INTO Research(kdID, ResearchType) VALUES (@kdID, 13)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 0, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 1, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 2, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 3, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 4, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 5, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 6, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 7, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 8, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 9, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 10, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 11, 0)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 0, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 1, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 2, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 3, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 4, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 5, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 6, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 7, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 8, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 9, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 10, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 11, 1)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 0, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 1, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 2, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 3, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 4, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 5, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 6, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 7, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 8, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 9, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 10, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 11, 2)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 0, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 1, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 2, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 3, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 4, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 5, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 6, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 7, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 8, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 9, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 10, 3)
						INSERT INTO UnitsOut(kdID, UnitType, WLID) VALUES (@kdID, 11, 3)
						INSERT INTO UnitsTraining(kdID, UnitType, Complete) VALUES (@kdID, 0, 200)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 1)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 2)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 3)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 4)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 5)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 6)
						INSERT INTO UnitsTraining(kdID, UnitType, Complete) VALUES (@kdID, 7, 10)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 8)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 9)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 10)
						INSERT INTO UnitsTraining(kdID, UnitType) VALUES (@kdID, 11)
						INSERT INTO WLs(kdID, WLID) VALUES (@kdID, 0)
						INSERT INTO WLs(kdID, WLID) VALUES (@kdID, 1)
						INSERT INTO WLs(kdID, WLID) VALUES (@kdID, 2)
	
						INSERT INTO WLs(kdID, WLID) VALUES (@kdID, 3)
						INSERT INTO AccountStatus(kdID, NewbieHours, Newbie) VALUES(@kdID, 0, 0)
						INSERT INTO Activation(kdID, ActivationCode) VALUES (@kdID, @ActivationCode)
						INSERT INTO Land(kdID) VALUES(@kdID)
						INSERT INTO Missiles(kdID) VALUES(@kdID)
						INSERT INTO Shields(kdID) VALUES(@kdID)
						UPDATE Kingdoms SET [Money] = 1000000 WHERE kdID = @kdID
						IF @PlanetType = 1
						BEGIN
							UPDATE Research SET Points = 120000 WHERE ResearchType = 5 AND kdID = @kdID
						END
						IF @PlanetType = 2
						BEGIN
							UPDATE Research SET Points = 60000 WHERE ResearchType = 8 AND kdID = @kdID
							UPDATE Research SET Points = 40000 WHERE ResearchType = 10 AND kdID = @kdID
						END
						IF @PlanetType = 3
						BEGIN
							UPDATE Research SET Points = 60000 WHERE ResearchType = 8 AND kdID = @kdID
							UPDATE Research SET Points = 30000 WHERE ResearchType = 9 AND kdID = @kdID
						END
						IF @PlanetType = 4
						BEGIN
							UPDATE Research SET Points = 144000 WHERE ResearchType = 6 AND kdID = @kdID
						END
						IF @PlanetType = 8
						BEGIN
							UPDATE Research SET Points = 120000 WHERE ResearchType = 5 AND kdID = @kdID
							UPDATE Research SET Points = 144000 WHERE ResearchType = 6 AND kdID = @kdID
							UPDATE Research SET Points = 1200000 WHERE ResearchType = 7 AND kdID = @kdID
						END
						IF @RaceType = 0
						BEGIN
							UPDATE Research SET Points = 40000 WHERE ResearchType = 12 AND kdID = @kdID
						END
						IF @RaceType = 1
						BEGIN
							UPDATE Research SET Points = 40000 WHERE ResearchType = 11 AND kdID = @kdID
						END
						IF @RaceType = 2
						BEGIN
							UPDATE Research SET Points = 40000 WHERE ResearchType = 12 AND kdID = @kdID
						END
						IF @RaceType = 3
						BEGIN
							UPDATE Research SET Points = 40000 WHERE ResearchType = 13 AND kdID = @kdID
						END
						UPDATE Research SET Points = Points + Scientists WHERE kdID = @kdID
						UPDATE Research SET ResearchPercent = dbo.CalcResearchPercent(kdID, ResearchType) WHERE kdID = @kdID
						UPDATE AccountStatus SET KingdomName = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID),  RulerName = (SELECT RulerName FROM Kingdoms WHERE kdID = @kdID) WHERE kdID = @kdID
						EXEC dbo.SendMessage 'Welcome to SKlone!', @kdID, @kdID
						SET @Result = 5 /* account created */
					END
	RETURN(@Result)
