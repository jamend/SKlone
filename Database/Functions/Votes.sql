/****** Object:  User Defined Function dbo.Votes    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.Votes
	(
		@kdID int
	)
RETURNS tinyint
BEGIN
	RETURN(SELECT COUNT(Vote) FROM Kingdoms WHERE Vote = @kdID)
END
