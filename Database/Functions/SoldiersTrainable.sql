/****** Object:  User Defined Function dbo.SoldiersTrainable    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.SoldiersTrainable
	(
		@kdID int
	)
RETURNS int
BEGIN
	DECLARE @Result int
	SET @Result = (SELECT (Population / 10) - dbo.SoldiersTraining(kdID) FROM Kingdoms WHERE kdID = @kdID)
	IF @Result < 0 SET @Result = 0
	IF (CAST(@Result AS bigint) * 150) > dbo.KingdomMoney(@kdID) SET @Result = (SELECT [Money] / 150 FROM Kingdoms WHERE kdID = @kdID)
	RETURN(@Result)
END
