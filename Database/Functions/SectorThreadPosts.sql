/****** Object:  User Defined Function dbo.SectorThreadPosts    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SectorThreadPosts
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM SectorForumsPosts WHERE ThreadID = @ThreadID)
END
