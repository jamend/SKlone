/****** Object:  User Defined Function dbo.AdminForumThread    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.AdminForumThread
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT ForumID FROM AdminForumThreads WHERE ThreadID = @ThreadID)
END
