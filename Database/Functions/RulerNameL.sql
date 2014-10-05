/****** Object:  User Defined Function dbo.RulerNameL    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.RulerNameL
	(
		@kdID int
	)
RETURNS nvarchar(50)
BEGIN
	DECLARE @Total nvarchar(50)
	SET @Total = (SELECT RulerName FROM Kingdoms WHERE kdID = @kdID)
	RETURN(@Total)
END
