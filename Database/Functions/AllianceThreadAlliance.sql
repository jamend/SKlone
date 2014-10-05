/****** Object:  User Defined Function dbo.AllianceThreadAlliance    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadAlliance
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AllianceID FROM AllianceForumsThreads WHERE ThreadID = @ThreadID)
END
