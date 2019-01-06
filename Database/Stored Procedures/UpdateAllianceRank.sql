/****** Object:  Stored Procedure dbo.UpdateAllianceRank    Script Date: 5/1/2004 6:12:40 PM ******/
CREATE PROCEDURE dbo.UpdateAllianceRank AS
	UPDATE Kingdoms SET Networth = dbo.CalcNetworth(kdID) WHERE dbo.IsDead(kdID) = 0
	UPDATE Alliances SET Rank = 0
	CREATE TABLE #Temp(Rank int IDENTITY(1, 1), AllianceID int)
	UPDATE Alliances SET Networth = dbo.AllianceNetworth(AllianceID), AverageNetworth = dbo.AllianceAverageNetworth(AllianceID)
	INSERT INTO #Temp(AllianceID) SELECT TOP 100 AllianceID FROM Alliances ORDER BY Networth DESC
	UPDATE Alliances SET Alliances.Rank = #Temp.Rank FROM #Temp, Alliances WHERE #Temp.AllianceID = Alliances.AllianceID
	/*Decease War Status*/
	UPDATE Alliances SET WarStatus = WarStatus - 1 WHERE WarStatus > 0
	UPDATE Alliances SET WarStatus = NULL WHERE WarStatus = 0
	/*delete kingdoms*/
	UPDATE AccountStatus SET DeleteDate = 1 WHERE LoggedIn = 1 AND Dead = 1
	UPDATE AccountStatus SET DeleteDate = 1 WHERE DeleteDate <= 0
	UPDATE AccountStatus SET DeleteDate = 12 WHERE Dead = 1 AND DeleteDate IS NULL
	UPDATE AccountStatus SET DeleteDate = 12 WHERE DeletePending = 1 AND DeleteDate IS NULL
	UPDATE AccountStatus SET DeleteDate = DeleteDate - 1 WHERE Dead = 1
	UPDATE AccountStatus SET DeleteDate = DeleteDate - 1 WHERE DeletePending = 1
	EXEC dbo.cleanup
	/* update inactive status */
	UPDATE AccountStatus SET Inactive = 1 FROM AccountStatus WHERE (SELECT TOP 1 LogInDate FROM LogIns WHERE kdID = AccountStatus.kdID ORDER BY LogInDate DESC) < DATEADD(hour, -48, GETDATE()) AND dbo.IsDead(kdID) = 0
		/*Decease Alliance Wait*/
	UPDATE Sectors SET AllianceWait = AllianceWait - 1 WHERE AllianceWait > 0
	
	/* clear old news */
	DELETE FROM SectorNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM AllianceNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM UniversalNews WHERE NewsDate = DATEADD(day, -4, GETDATE())
	DELETE FROM PersonalNews WHERE NewsDate = DATEADD(day, -3, GETDATE()) AND NewsRead = 1
