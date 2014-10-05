/****** Object:  Stored Procedure dbo.UpdateKingdomsRulerName    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UpdateKingdomsRulerName
	(
		@Number nvarchar(24),
		@kdID int
	)
AS
	UPDATE Kingdoms SET RulerName = @Number WHERE kdID = @kdID
