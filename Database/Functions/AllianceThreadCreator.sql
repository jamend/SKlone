/****** Object:  User Defined Function dbo.AllianceThreadCreator    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadCreator
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Creator FROM AllianceForumsThreads WHERE ThreadID = @ThreadID)
END
