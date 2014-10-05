/****** Object:  User Defined Function dbo.Buildable    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.Buildable
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	DECLARE @Buildable bigint
	DECLARE @BuildCost int
	DECLARE @Money bigint
	SET @Buildable = dbo.FreeLand(@kdID)
	SET @Money = (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID)
	SET @BuildCost = dbo.BuildCost(@kdID)
	IF (@BuildCost * @Buildable) > @Money
	BEGIN
		SET @Buildable = @Money / @BuildCost
	END
	RETURN(@Buildable)
END
