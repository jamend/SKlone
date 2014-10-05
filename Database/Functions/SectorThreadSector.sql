/****** Object:  User Defined Function dbo.SectorThreadSector    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.SectorThreadSector
	(
		@ThreadID int
	)
RETURNS int
BEGIN
	RETURN(SELECT SectorID FROM SectorForumsThreads WHERE ThreadID = @ThreadID)
END
