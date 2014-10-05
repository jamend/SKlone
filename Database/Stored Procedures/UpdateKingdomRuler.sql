/****** Object:  Stored Procedure dbo.UpdateKingdomRuler    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UpdateKingdomRuler
(
	@kdID int
)
AS
UPDATE AccountStatus SET KingdomName = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID),  RulerName = (SELECT RulerName FROM Kingdoms WHERE kdID = @kdID) WHERE kdID = @kdID
