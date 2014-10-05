/****** Object:  User Defined Function dbo.PercentResearched    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.PercentResearched
	(
		@kdID int,
		@ResearchType tinyint
	)
RETURNS tinyint
BEGIN
	RETURN(SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = @ResearchType)
END
