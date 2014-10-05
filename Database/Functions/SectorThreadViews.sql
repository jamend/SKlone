/****** Object:  User Defined Function dbo.SectorThreadViews    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SectorThreadViews
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT [Views] FROM SectorForumsThreads WHERE ThreadID = @ThreadID)
END
