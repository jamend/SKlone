/****** Object:  User Defined Function dbo.RaceType    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.RaceType
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT RaceType FROM Kingdoms WHERE kdID = @kdID)
END
