/****** Object:  User Defined Function dbo.AllianceThreadViews    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadViews
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT [Views] FROM AllianceForumsThreads WHERE ThreadID = @ThreadID)
END
