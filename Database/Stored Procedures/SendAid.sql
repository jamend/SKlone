/****** Object:  Stored Procedure dbo.SendAid    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.SendAid
	(
		@Attacker int,
		@Defender int,
		@Money bigint,
		@Soldiers bigint,
		@Power bigint,
		@Population bigint,
		@SKDate nvarchar(24),
		@Result nvarchar(512) output
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
	IF (SELECT TroubleMode FROM Kingdoms WHERE kdID = @Defender) = 0
	BEGIN
		SET @Result = 'The kingdom you are trying to send aid to is not in trouble mode.'
	END
	ELSE
	IF @AttackerDead = 1
	BEGIN
		SET @Result = 'Your not able to send aid when your dead.'
	END
	ELSE
	IF @DefenderNewbie = 1
	BEGIN
		SET @Result = 'The kingdom you are trying to send aid to is in newbie mode.'
	END
	ELSE
	IF @DefenderVacation = 1
	BEGIN
		SET @Result = 'The kingdom you are trying to send aid to is in vacation mode.'
	END
	ELSE
	IF @AttackerVacation = 1
	BEGIN
		SET @Result = 'You must leave vacation mode before sending aid.'
	END
	ELSE
				BEGIN
					IF (SELECT Dead FROM AccountStatus WHERE kdID = @Defender) = 1
					BEGIN
						SET @Result = 'The kingdom you are trying to send aid to is dead.' /* dead */
					END
					ELSE
					BEGIN
						IF @Money = NULL
						BEGIN 
							SET @Money = 0
						END
						IF @Power = NULL
						BEGIN 
							SET @Power = 0
						END
						IF @Population = NULL
						BEGIN 
							SET @Population = 0
						END
						IF @Soldiers = NULL
						BEGIN 
							SET @Soldiers = 0
						END
						DECLARE @AttackerName nvarchar(48)
						DECLARE @DefenderName nvarchar(48)
						SET @AttackerName = dbo.FullKingdomNameC(@Attacker)
						SET @DefenderName = dbo.FullKingdomNameC(@Defender)
						DECLARE @PersonalNews nvarchar(512)
							SET @PersonalNews = 'We have been send aid from <b>' + @AttackerName + '</b>. We have recieved <b>' + dbo.FormatNumber(@Money) + '</b> money, <b>' + dbo.FormatNumber(@Power) + '</b> power, <b>' + dbo.FormatNumber(@Population) + '</b> population, and <b>' + dbo.FormatNumber(@Soldiers) + '</b> soldiers.'
							SET @Result = 'We have sent aid to <b>' + @DefenderName + '</b>. We have sent <b>' + dbo.FormatNumber(@Money) + '</b> money, <b>' + dbo.FormatNumber(@Power) + '</b> power, <b>' + dbo.FormatNumber(@Population) + '</b> population, and <b>' + dbo.FormatNumber(@Soldiers) + '</b> soldiers.'
							INSERT INTO PersonalNews(kdID, NewsText) VALUES (@Defender, @PersonalNews)
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@DefenderSector, 6, 'Our kingdom ' + @DefenderName + ' has recieved aid from ' + @AttackerName + '.')
							UPDATE Kingdoms SET Population = Population - @Population WHERE kdID = @Attacker
							UPDATE Kingdoms SET Population = Population + @Population WHERE kdID = @Defender
							UPDATE Kingdoms SET [Power] = [Power] - @Power WHERE kdID = @Attacker
							UPDATE Kingdoms SET [Power] = [Power] + @Power WHERE kdID = @Defender
							UPDATE Kingdoms SET [Money] = [Money] - @Money WHERE kdID = @Attacker
							UPDATE Kingdoms SET [Money] = [Money] + @Money WHERE kdID = @Defender
							UPDATE UnitsTraining SET Complete = Complete - @Soldiers WHERE kdID = @Attacker AND UnitType = 0
							UPDATE UnitsTraining SET Complete = Complete + @Soldiers WHERE kdID = @Defender AND UnitType = 0
						
					END
				END
