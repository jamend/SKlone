/****** Object:  User Defined Function dbo.PopulationAid    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.PopulationAid
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT [Population]/10 FROM Kingdoms WHERE kdID = @kdID)
END
