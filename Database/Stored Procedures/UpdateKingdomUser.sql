/****** Object:  Stored Procedure dbo.UpdateKingdomUser    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.UpdateKingdomUser
	(
		@Number nvarchar(24),
		@kdID int
	)
AS
	UPDATE Accounts SET Account = @Number WHERE kdID = @kdID
