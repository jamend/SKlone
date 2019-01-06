/****** Object:  Stored Procedure dbo.DeclareWar    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.DeclareWar
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
		SET @UniversalNews = 'The <b>' + @AllianceNameAL + '</b> alliance has declared <b>war</b> against the <b>' + @AllianceName + '</b> alliance.'
		DECLARE @WarStatus nvarchar(16)
		SET @WarStatus = (SELECT WarStatus FROM Alliances WHERE AL = @kdID)
		IF @AllianceID IS NULL
		BEGIN
			SET @Result = 'You did not give complete orders.'
		END
		ELSE
		IF (SELECT COUNT(*) FROM Sectors WHERE AllianceID = @AllianceID) < 3
		BEGIN
			SET @Result = 'You must have three sectors in order to declare war.'
		END
		ELSE
		IF (SELECT WarStatus FROM Alliances WHERE AL = @kdID) IS NOT NULL
		BEGIN
		SET @Result = 'You can not declare war on another alliance for <b>' + @WarStatus + '</b> hours.'
		END
		ELSE
		IF @Alliance != @AllianceAL
		BEGIN
		UPDATE Alliances SET War = @AllianceID, WarStatus = 12 WHERE AL = @kdID
		INSERT INTO UniversalNews(PublicID, NewsType, NewsText) VALUES(1, 7, @UniversalNews)
		SET @Result = 'You have declared war on the <b>' + @AllianceName + '. '
		END
		ELSE
		BEGIN
		SET @Result = 'You can not declare war on your own alliance.'
		END
		IF (SELECT Peace FROM Alliances WHERE AL = @kdID) = @AllianceID
		BEGIN
			UPDATE Alliances SET Peace = NULL WHERE AllianceID = (SELECT AllianceID FROM Alliances WHERE AL = @kdID) 
		END
