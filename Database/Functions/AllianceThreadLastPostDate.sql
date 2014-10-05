/****** Object:  User Defined Function dbo.AllianceThreadLastPostDate    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceThreadLastPostDate
	(
		@ThreadID int
	)
RETURNS datetime
BEGIN
	RETURN(SELECT TOP 1 PostDate FROM AllianceForumsPosts WHERE ThreadID = @ThreadID ORDER BY PostDate DESC)
END
