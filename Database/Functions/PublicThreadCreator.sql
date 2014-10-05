/****** Object:  User Defined Function dbo.PublicThreadCreator    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PublicThreadCreator
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Creator FROM PublicForumsThreads WHERE ThreadID = @ThreadID)
END
