/****** Object:  User Defined Function dbo.KingdomNameL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.KingdomNameL
	(
		@kdID int
	)
RETURNS nvarchar(50)
BEGIN
	DECLARE @Total nvarchar(50)
	SET @Total = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID)
	RETURN(@Total)
END
