/****** Object:  User Defined Function dbo.SectorThreadLastPoster    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SectorThreadLastPoster
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT TOP 1 Poster FROM SectorForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
