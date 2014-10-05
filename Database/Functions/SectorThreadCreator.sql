/****** Object:  User Defined Function dbo.SectorThreadCreator    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.SectorThreadCreator
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Creator FROM SectorForumsThreads WHERE ThreadID = @ThreadID)
END
