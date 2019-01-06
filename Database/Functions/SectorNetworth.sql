/****** Object:  User Defined Function dbo.SectorNetworth    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.SectorNetworth
	(
		@SectorID int
	)
RETURNS bigint
BEGIN
	DECLARE @Networth bigint
	SET @Networth = (SELECT SUM(Networth) FROM Kingdoms WHERE SectorID = @SectorID)
	IF @Networth IS NULL
	BEGIN
		SET @Networth = 0
	END
	RETURN(@Networth)
END
