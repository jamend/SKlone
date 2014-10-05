/****** Object:  Stored Procedure dbo.DeclareNap    Script Date: 5/1/2004 6:12:37 PM ******/
CREATE PROCEDURE dbo.DeclareNap
	(
		@kdID int,
		@AllianceID nvarchar(16),
		@Result nvarchar(600) output
	)
AS
		DECLARE @AllianceAL int
		DECLARE @Alliance int
		DECLARE @AllianceName nvarchar(16)
		DECLARE @AllianceNameAL nvarchar(16)
		DECLARE @UniversalNews nvarchar(512)
		SET @AllianceAL = (SELECT AL FROM Alliances WHERE AL = @kdID)
		SET @Alliance = (SELECT AllianceID FROM Alliances WHERE AllianceName = @AllianceID)
		SET @AllianceName = (SELECT AllianceName FROM Alliances WHERE AllianceID = @AllianceID)
		SET @AllianceNameAL = (SELECT AllianceName FROM Alliances WHERE AL = @kdID)
		SET @UniversalNews = 'The <b>' + @AllianceNameAL + '</b> alliance has signed a <b>nap</b> treaty with the <b>' + @AllianceName + '</b> alliance.'
		DECLARE @WarStatus nvarchar(16)
		SET @WarStatus = (SELECT WarStatus FROM Alliances WHERE AL = @kdID)
		IF @AllianceID = NULL
		BEGIN
			SET @Result = 'You did not give complete orders.'
		END
		ELSE
		IF (SELECT COUNT(*) FROM Sectors WHERE AllianceID = @AllianceID) < 3
		BEGIN
			SET @Result = 'You must have three sectors in order to declare war.'
		END
		ELSE
		IF @Alliance != @AllianceAL
		BEGIN
		UPDATE Alliances SET NapSender = (SELECT AllianceID FROM Alliances WHERE AL = @kdID)  WHERE AllianceID = @AllianceID
		SET @Result = 'You have set a nap treaty with the <b>' + @AllianceName + '</b> alliance. '
		END
		ELSE
		BEGIN
		SET @Result = 'You can not set a nap treaty with your own alliance.'
		END
		IF (SELECT NapSender FROM Alliances WHERE AllianceID = @AllianceID) = (SELECT AllianceID FROM Alliances WHERE AL = @kdID)  AND (SELECT NapSender FROM Alliances WHERE AL = @kdID) = (SELECT AllianceID FROM Alliances WHERE AllianceID = @AllianceID)
		BEGIN
			UPDATE Alliances SET Nap = @AllianceID WHERE AL = @kdID
			UPDATE Alliances SET Nap = (SELECT AllianceID FROM Alliances WHERE AL = @kdID) WHERE AllianceID = @AllianceID
			UPDATE Alliances SET NapSender = NULL WHERE AL = @kdID
			UPDATE Alliances SET NapSender = NULL WHERE AllianceID = @AllianceID
			INSERT INTO UniversalNews(PublicID, NewsType, NewsText) VALUES(1, 7, @UniversalNews)
		END
