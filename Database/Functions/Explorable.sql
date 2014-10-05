/****** Object:  User Defined Function dbo.Explorable    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.Explorable
	(
		@kdID int
	)
RETURNS int
BEGIN
	DECLARE @Explorable int
	DECLARE @Money bigint
	DECLARE @Cost int
	SET @Cost = dbo.ExploreCost(@kdID)
	SET @Money = (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID)
	SET @Explorable = (dbo.KingdomLand(@kdID) / 10) - dbo.Exploring(@kdID)
	IF @Money < CAST(@Cost AS bigint) * @Explorable
	BEGIN
		SET @Explorable = @Money / @Cost
	END
	RETURN(@Explorable)
END
