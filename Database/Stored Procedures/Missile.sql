/****** Object:  Stored Procedure dbo.Missile    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.Missile
	(
		@Attacker int,
		@Defender int,
		@SKDate nvarchar(24),
		@Result nvarchar(512) output
	)
AS
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	DECLARE @AttackerAlliance int
	DECLARE @DefenderAlliance int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @AttackerAlliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @AttackerSector)
	SET @DefenderAlliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @DefenderSector)
	IF dbo.AllianceRelationB(@AttackerAlliance, @DefenderAlliance) = 4
	BEGIN
		SET @Result = '0' /* nap */
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
					IF (SELECT Nuclear FROM Missiles WHERE kdID = @Attacker) = 0
						BEGIN
						SET @Result = 'You are out of Nuclear Missiles.'
						END
					ELSE
					BEGIN
						DECLARE @AttackerName nvarchar(48)
						DECLARE @DefenderName nvarchar(48)
						DECLARE @Nuclear tinyint
						SET @Nuclear = (SELECT Nuclear FROM Missiles WHERE kdID = @Attacker)
						SET @AttackerName = dbo.FullKingdomNameC(@Attacker)
						SET @DefenderName = dbo.FullKingdomNameC(@Defender)
						DECLARE @AttackerSectorNews nvarchar(512)
						DECLARE @DefenderSectorNews nvarchar(512)
						DECLARE @PersonalNews nvarchar(512)
						BEGIN
							/* success */
							
							DECLARE @LandGain int
							DECLARE @PopulationGain bigint
							SET @LandGain = dbo.NuclearLoss(@Attacker, @Defender)
							SET @PopulationGain = (SELECT Population FROM Kingdoms WHERE kdID = @Defender) * 0.02
							UPDATE Land SET Land = Land - @LandGain WHERE kdID = @Defender
							UPDATE Kingdoms SET Population = Population - @PopulationGain WHERE kdID = @Defender
							UPDATE Missiles SET Nuclear = 0 WHERE kdID = @Attacker
							IF (SELECT Land FROM Land WHERE kdID = @Defender) = 0 UPDATE AccountStatus SET Dead = 1, DieDate = GETDATE() WHERE kdID = @Defender
							IF (SELECT Population FROM Kingdoms WHERE kdID = @Defender) <= 0 UPDATE AccountStatus SET Dead = 1, DieDate = GETDATE() WHERE kdID = @Defender
							SET @AttackerSectorNews = 'On ' + @SKDate + ', our brave kingdom ' + @AttackerName + ' launched a nuclear missile at  ' + @DefenderName + ' and destoried <b>' + dbo.FormatNumber(@LandGain) + '</b> land.'
							SET @DefenderSectorNews = 'On ' + @SKDate + ', our kingdom ' + @DefenderName + ' was hit with a nuclear missile from ' + @AttackerName + ' and lost <b>' + dbo.FormatNumber(@LandGain) + '</b> land.'
							SET @PersonalNews = 'Our planet has been hit by a nuclear missile from ' + @AttackerName + ' . We have lost <b>' + dbo.FormatNumber(@LandGain) + '</b> land,  and <b>' + dbo.FormatNumber(@PopulationGain) + '</b> population.<br>'
							SET @Result = 'The missile launch is complete. Our officers have reported that our nuclear missile has destoried <b>' + dbo.FormatNumber(@LandGain) + '</b> land,  and killed <b>' + dbo.FormatNumber(@PopulationGain) + '</b> population.<br>'
						END
						IF @AttackerSector = @DefenderSector
						BEGIN
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@AttackerSector, 5, @AttackerSectorNews)
							IF @AttackerAlliance IS NOT NULL INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@AttackerAlliance, 5, @AttackerSectorNews)
						END
						ELSE
						BEGIN
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@AttackerSector, 5, @AttackerSectorNews)
							INSERT INTO SectorNews(SectorID, NewsType, NewsText) VALUES(@DefenderSector, 5, @DefenderSectorNews)
							IF dbo.AllianceRelationB(@AttackerAlliance, @DefenderAlliance) = 2
							BEGIN
								INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@AttackerAlliance, 5, @AttackerSectorNews)
								INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@DefenderAlliance, 5, @DefenderSectorNews)
							END
						END
						INSERT INTO PersonalNews(kdID, NewsText) VALUES (@Defender, @PersonalNews)
						print @Result
					END
				END
			END
