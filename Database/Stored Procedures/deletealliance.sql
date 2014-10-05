/****** Object:  Stored Procedure dbo.deletealliance    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.deletealliance
	(
		@kdID int
	)
AS
	DECLARE @AllianceID int
	SET @AllianceID = (SELECT AllianceID FROM Alliances WHERE AL = @kdID)
	UPDATE Sectors SET AllianceID = 0 WHERE AllianceID = @AllianceID
	DELETE FROM Alliances WHERE AL = @kdID
