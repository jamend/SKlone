/****** Object:  Stored Procedure dbo.DeleteKingdomB    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.DeleteKingdomB
AS
	DECLARE @kdID int
	SET @kdID = (SELECT kdID FROM AccountStatus WHERE DeleteDate = 0)
	UPDATE Messages SET Sender = Null WHERE Sender = @kdID
	UPDATE Sectors SET AllianceID = 0 WHERE AllianceID = (SELECT AllianceID FROM Alliances WHERE AL = @kdID)
	UPDATE Kingdoms SET Vote = Null WHERE Vote = @kdID
	DELETE FROM Accounts WHERE kdID = @kdID
	DELETE FROM AccountStatus WHERE kdID = @kdID
	DELETE FROM Alliances WHERE AL = @kdID
	DELETE FROM Activation WHERE kdID = @kdID
	DELETE FROM Buildings WHERE kdID = @kdID
	DELETE FROM Kingdoms WHERE kdID = @kdID
	DELETE FROM Land WHERE kdID = @kdID
	DELETE FROM LogIns WHERE kdID = @kdID
	DELETE FROM Messages WHERE Recipient = @kdID
	DELETE FROM Missiles WHERE kdID = @kdID
	DELETE FROM PersonalNews WHERE kdID = @kdID
	DELETE FROM Research WHERE kdID = @kdID
	DELETE FROM Shields WHERE kdID = @kdID
	DELETE FROM UnitsOut WHERE kdID = @kdID
	DELETE FROM UnitsTraining WHERE kdID = @kdID
	DELETE FROM WLs WHERE kdID = @kdID
