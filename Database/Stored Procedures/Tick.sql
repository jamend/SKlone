CREATE PROCEDURE dbo.Tick AS
	IF (SELECT StartDate FROM ServerStatus) <= GETDATE() 
	BEGIN
		UPDATE ServerStatus SET NotStarted = 0
		EXEC dbo.TickB
	END
	ELSE
	BEGIN
		EXEC dbo.UpdateAllianceRank
	END