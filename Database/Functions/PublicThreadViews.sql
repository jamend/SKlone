/****** Object:  User Defined Function dbo.PublicThreadViews    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PublicThreadViews
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT [Views] FROM PublicForumsThreads WHERE ThreadID = @ThreadID)
END
