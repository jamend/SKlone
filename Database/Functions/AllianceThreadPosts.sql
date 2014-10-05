/****** Object:  User Defined Function dbo.AllianceThreadPosts    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadPosts
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM AllianceForumsPosts WHERE ThreadID = @ThreadID)
END
