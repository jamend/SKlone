/****** Object:  User Defined Function dbo.SectorLastPoster    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.SectorLastPoster
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT TOP 1 Poster FROM SectorForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
