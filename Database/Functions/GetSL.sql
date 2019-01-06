/****** Object:  User Defined Function dbo.GetSL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.GetSL
	(
		@SectorID int
	)
RETURNS int
BEGIN
	DECLARE @Result int
	SET @Result = (SELECT TOP 1 a.kdID FROM Kingdoms a WHERE a.SectorID = @SectorID ORDER BY (SELECT COUNT(kdID) FROM Kingdoms WHERE Vote = a.kdID AND SectorID = a.SectorID) DESC, a.Networth DESC)
	IF @Result IS NULL SET @Result = 0
	RETURN(@Result)
END
