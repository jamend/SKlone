/****** Object:  Stored Procedure dbo.SetWLOut    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.SetWLOut
	(
		@kdID int,
		@ReturnTime tinyint,
		@WLFactor real
	)
AS
	DECLARE @WL tinyint
	SET @WL = (SELECT TOP 1 WLID FROM WLs WHERE WLOut = 0 AND kdID = @kdID)
	UPDATE WLs SET WLOut = 1, WLTime = ROUND(@WLFactor * @ReturnTime, 0) WHERE WLID = @WL AND kdID = @kdID
	RETURN(@WL)
