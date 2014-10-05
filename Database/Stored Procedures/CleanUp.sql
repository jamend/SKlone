/****** Object:  Stored Procedure dbo.CleanUp    Script Date: 5/1/2004 6:12:37 PM ******/
CREATE PROCEDURE dbo.CleanUp
AS
	DELETE FROM Accounts WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Accounts.kdID) > 0
	DELETE FROM Scores WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Scores.kdID) > 0
	UPDATE Alliances SET AL = 0 WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Alliances.AL) > 0
	DELETE FROM Activation WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Activation.kdID) > 0
	DELETE FROM SKloneChat WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = SkloneChat.kdID) > 0
	DELETE FROM Buildings WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Buildings.kdID) > 0
	DELETE FROM Kingdoms WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Kingdoms.kdID) > 0
	DELETE FROM Land WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Land.kdID) > 0
	DELETE FROM LogIns WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = LogIns.kdID) > 0
	DELETE FROM Messages WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Messages.Recipient) > 0
	DELETE FROM Missiles WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Missiles.kdID) > 0
	DELETE FROM PersonalNews WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = PersonalNews.kdID) > 0
	DELETE FROM Research WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Research.kdID) > 0
	DELETE FROM SignupIPs WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = SignupIPs.kdID) > 0
	DELETE FROM Shields WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = Shields.kdID) > 0
	DELETE FROM UnitsOut WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = UnitsOut.kdID) > 0
	DELETE FROM UnitsTraining WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = UnitsTraining.kdID) > 0
	DELETE FROM WLs WHERE (SELECT COUNT(*) FROM AccountStatus WHERE DeleteDate = 0 AND kdID = WLs.kdID) > 0
