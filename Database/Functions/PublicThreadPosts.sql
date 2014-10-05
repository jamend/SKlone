/****** Object:  User Defined Function dbo.PublicThreadPosts    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PublicThreadPosts
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM PublicForumsPosts WHERE ThreadID = @ThreadID)
END
