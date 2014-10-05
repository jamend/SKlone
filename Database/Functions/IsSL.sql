/****** Object:  User Defined Function dbo.IsSL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.IsSL
	(
		@kdID int,
		@SectorID int
	)
RETURNS nvarchar(22)
BEGIN
	DECLARE @Result nvarchar(22)
	IF @kdID = dbo.GetSL(@SectorID)
	BEGIN
		SET @Result = '<b>Sector Leader</b>'
	END
	ELSE
	BEGIN
		SET @Result = ' '
	END
	RETURN(@Result)
END
