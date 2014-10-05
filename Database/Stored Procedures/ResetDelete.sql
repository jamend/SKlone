/****** Object:  Stored Procedure dbo.ResetDelete    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.ResetDelete AS
BEGIN
UPDATE    Sectors
SET              SectorName = N'Welcome to SKlone', SectorMessage = N'Welcome to SKlone', AllianceID = 0, GroupPassword = N'sklone', AllianceWait = 0, GroupSignup = 0
DELETE FROM AccountIPs
DELETE FROM Accounts
DELETE FROM AccountStatus
DELETE FROM Activation
DELETE FROM AllianceAllies
DELETE FROM AllianceForumsPosts
DELETE FROM AllianceForumsThreads
DELETE FROM AllianceNAPs
DELETE FROM AllianceNews
DELETE FROM Alliances
DELETE FROM Bans
DELETE FROM Buildings
DELETE FROM ErrorLog
DELETE FROM FailedLogins
DELETE FROM Kingdoms
DELETE FROM Land
DELETE FROM LogIns
DELETE FROM Messages
DELETE FROM PersonalNews
DELETE FROM Research
DELETE FROM Rewards
DELETE FROM Scores
DELETE FROM SectorForumsPosts
DELETE FROM SectorForumsThreads
DELETE FROM SectorNews
DELETE FROM Shields
DELETE FROM SignupIPs
DELETE FROM UnitsOut
DELETE FROM UnitsTraining
DELETE FROM UniversalNews
DELETE FROM PublicForumsPosts
DELETE FROM PublicForumsThreads
DELETE FROM WLs
END
