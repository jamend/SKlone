/****** Object:  User Defined Function dbo.PublicThreadLastPostDate    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PublicThreadLastPostDate
	(
		@ThreadID int
	)
RETURNS datetime
BEGIN
	RETURN(SELECT TOP 1 PostDate FROM PublicForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
