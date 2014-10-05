/****** Object:  User Defined Function dbo.AllianceThreadLastPoster    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadLastPoster
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT TOP 1 Poster FROM AllianceForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
