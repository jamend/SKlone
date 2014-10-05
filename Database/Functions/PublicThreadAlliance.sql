/****** Object:  User Defined Function dbo.PublicThreadAlliance    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PublicThreadAlliance
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT PublicID FROM PublicForumsThreads WHERE ThreadID = @ThreadID)
END
