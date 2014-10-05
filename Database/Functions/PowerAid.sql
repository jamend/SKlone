/****** Object:  User Defined Function dbo.PowerAid    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PowerAid
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT [Power]/10 FROM Kingdoms WHERE kdID = @kdID)
END
