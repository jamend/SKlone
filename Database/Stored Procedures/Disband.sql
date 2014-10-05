/****** Object:  Stored Procedure dbo.Disband    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.Disband
	(
		@kdID int,
		@Units int,
		@UnitType tinyint
	)
AS
	IF @Units > dbo.Disbandable(@kdID, @UnitType) SET @Units = dbo.Disbandable(@kdID, @UnitType)
	UPDATE UnitsTraining SET Complete = Complete - @Units WHERE kdID = @kdID AND UnitType = @UnitType
	UPDATE Kingdoms SET Population = Population + @Units WHERE kdID = @kdID
