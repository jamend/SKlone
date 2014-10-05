/****** Object:  User Defined Function dbo.FullKingdomNameI    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullKingdomNameI
	(
		@kdID int
	)
RETURNS nvarchar(48)
BEGIN
	DECLARE @Name nvarchar(48)
	SET @Name = (SELECT [Name] + ' (X:' + CAST(X AS nvarchar(2)) + ',Y:' + CAST(Y AS nvarchar(2)) + ')' FROM Kingdoms WHERE kdID = @kdID)
	IF (SELECT LoggedIn FROM AccountStatus WHERE kdID = @kdID) = 1 SET @Name = @Name + ' @'
	RETURN(@Name)
END
