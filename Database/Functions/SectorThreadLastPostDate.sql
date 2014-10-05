/****** Object:  User Defined Function dbo.SectorThreadLastPostDate    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.SectorThreadLastPostDate
	(
		@ThreadID int
	)
RETURNS datetime
BEGIN
	RETURN(SELECT TOP 1 PostDate FROM SectorForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
