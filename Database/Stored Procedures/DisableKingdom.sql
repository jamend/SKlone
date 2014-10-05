/****** Object:  Stored Procedure dbo.DisableKingdom    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.DisableKingdom
	(
		@kdID int
	)
AS
	UPDATE AccountStatus SET Cheater = 1 WHERE kdID = @kdID
