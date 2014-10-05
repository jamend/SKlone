/****** Object:  User Defined Function dbo.PublicThreadLastPoster    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PublicThreadLastPoster
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT TOP 1 Poster FROM PublicForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
