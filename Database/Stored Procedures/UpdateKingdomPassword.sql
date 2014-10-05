/****** Object:  Stored Procedure dbo.UpdateKingdomPassword    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.UpdateKingdomPassword
	(
		@Number nvarchar(24),
		@kdID int
	)
AS
	UPDATE Accounts SET Password = @Number WHERE kdID = @kdID
