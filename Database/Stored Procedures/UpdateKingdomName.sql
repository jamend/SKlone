/****** Object:  Stored Procedure dbo.UpdateKingdomName    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UpdateKingdomName
	(
		@Number nvarchar(24),
		@kdID int
	)
AS
	UPDATE Kingdoms SET [Name] = @Number WHERE kdID = @kdID
