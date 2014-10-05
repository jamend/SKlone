/****** Object:  Stored Procedure dbo.Raze    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.Raze
	(
		@kdID int,
		@Buildings int,
		@BuildingType tinyint
	)
AS
	DECLARE @Cost int
	DECLARE @BuildingsAvailable int
	SET @BuildingsAvailable = (SELECT Built FROM Buildings WHERE kdID = @kdID AND BuildingType = @BuildingType)
	IF @BuildingsAvailable < @Buildings SET @Buildings = @BuildingsAvailable
	SET @Cost = @Buildings * 50
	EXEC dbo.BuyStuff @kdID, @Cost
	UPDATE Buildings SET Built = Built - @Buildings WHERE kdID = @kdID AND BuildingType = @BuildingType
