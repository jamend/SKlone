/****** Object:  Stored Procedure dbo.CreateKingdomB    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.CreateKingdomB
	(
		@IP nvarchar(16),
		@ActivationCode bigint,
		@Account nvarchar(32),
		@Password nvarchar(64),
		@Email nvarchar(256),
		@KingdomName nvarchar(24),
		@RulerName nvarchar(24),
		@PlanetType tinyint,
		@RaceType tinyint,
		@Galaxy int,
		@Sector int,
		@GroupPassword nvarchar(16)
	)
AS
	DECLARE @Result int
	DECLARE @SectorIDB int
	DECLARE @SectorIDC nvarchar(15)
	DECLARE @GroupPasswordB nvarchar(15)
	DECLARE @GroupSignUp int
	SET @GroupSignUp = (SELECT GroupSignUp FROM Sectors WHERE Galaxy = @Galaxy AND Sector = @Sector)
	SET @SectorIDB = (SELECT SectorID FROM Sectors WHERE Galaxy = @Galaxy AND Sector = @Sector AND GroupPassword = @GroupPassword AND dbo.KingdomCount(SectorID) <= 20)
	SET @SectorIDC = (SELECT SectorID FROM Sectors WHERE Galaxy = @Galaxy AND Sector = @Sector AND GroupPassword = @GroupPassword)
	SET @GroupPasswordB = (SELECT GroupPassword FROM Sectors WHERE Galaxy = @Galaxy AND Sector = @Sector)
	IF (SELECT COUNT(SignupIP) FROM SignupIPs WHERE SignupIP = @IP) > 0
	BEGIN
		SET @Result = 0 /* already signed up */
	END
	ELSE
	BEGIN
		IF (SELECT COUNT(Account) FROM Accounts WHERE Account = @Account) > 0
		BEGIN
			SET @Result = 1 /* account name in use */
		END
		ELSE
		BEGIN
			IF (SELECT COUNT(Email) FROM Accounts WHERE Email = @Email) > 0
			BEGIN
				SET @Result = 2 /* they  in use */
			END
			ELSE
			BEGIN
				IF (SELECT COUNT([Name]) FROM Kingdoms WHERE [Name] = @KingdomName) > 0
				BEGIN
					SET @Result = 3 /* kingdom name in use */
				END
				ELSE
				BEGIN
					IF (SELECT COUNT(*) FROM Bans WHERE BanEmail = @Email OR BanIP = @IP OR BanKDName = @KingdomName OR BanRulerName = @RulerName OR BanAccount = @Account) > 0
					BEGIN
						SET @Result = 4 /* banned */
					END
					ELSE
					IF @SectorIDB = 20
					BEGIN
						SET @Result = 6
					END
					ELSE
					IF @GroupPasswordB != @GroupPassword
					BEGIN
						SET @Result = 7
					END
					ELSE
					IF @GroupSignUp = 4
					BEGIN
						SET @Result = 8
					END
					ELSE
					BEGIN
						DECLARE @kdID int
						INSERT INTO Accounts(Account, [Password], Email) VALUES (@Account, @Password, @Email)
						SET @kdID = @@IDENTITY
					DECLARE @SectorID int
					CREATE TABLE #Temp(SectorIndex int IDENTITY(1, 1), SectorID int)
					INSERT INTO #Temp(SectorID) SELECT SectorID FROM Sectors WHERE dbo.KingdomCount(SectorID) < 20
					SET @SectorID = (SELECT SectorID FROM Sectors WHERE Galaxy = @Galaxy AND Sector = @Sector AND GroupPassword = @GroupPassword AND dbo.KingdomCount(SectorID) <= 20 AND SectorOpen = 1)
					UPDATE Sectors SET GroupSignUp = GroupSignUp + 1 WHERE SectorID = @SectorID
						INSERT INTO Kingdoms(kdID, [Name], RulerName, RaceType, PlanetType, SectorID) VALUES (@kdID, @KingdomName, @RulerName, @RaceType, @PlanetType, @SectorID)
						INSERT INTO Rewards(kdID, LastLand, LastMoney) VALUES (@kdID, 48, 48)
						INSERT INTO Scores(kdID) VALUES (@kdID)
						/*Profiles*/
						INSERT INTO Profiles(kdID) VALUES (@kdID)
						/*SKlone Chat User Update*/
						INSERT INTO SKloneChat(UserName, [Password], Email, kdID) VALUES (@KingdomName, @Password, @Email, @kdID)
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
						INSERT INTO AccountStatus(kdID) VALUES(@kdID)
						INSERT INTO Activation(kdID, ActivationCode) VALUES (@kdID, @ActivationCode)
						INSERT INTO Land(kdID) VALUES(@kdID)
						INSERT INTO Missiles(kdID) VALUES(@kdID)
						INSERT INTO Shields(kdID) VALUES(@kdID)
						INSERT INTO SignupIPs(SignupIP, kdID) VALUES (@IP, @kdID)
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
						INSERT INTO LogIns(LogInIP, LogInDate, kdID) VALUES (@IP, GETDATE(), @kdID)
						UPDATE Research SET Points = Points + Scientists WHERE kdID = @kdID
						UPDATE Research SET ResearchPercent = dbo.CalcResearchPercent(kdID, ResearchType) WHERE kdID = @kdID
						UPDATE AccountStatus SET KingdomName = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID),  RulerName = (SELECT RulerName FROM Kingdoms WHERE kdID = @kdID) WHERE kdID = @kdID
						EXEC dbo.SendMessage 'Welcome to SKlone!', @kdID, @kdID
						SET @Result = 5 /* account created */
					END
				END
			END
		END
	END
	RETURN(@Result)
