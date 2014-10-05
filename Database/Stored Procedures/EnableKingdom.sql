/****** Object:  Stored Procedure dbo.EnableKingdom    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.EnableKingdom
	(
		@kdID int
	)
AS
	UPDATE AccountStatus SET Cheater = 0 WHERE kdID = @kdID
