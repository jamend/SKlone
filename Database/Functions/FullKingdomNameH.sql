/****** Object:  User Defined Function dbo.FullKingdomNameH    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.FullKingdomNameH
	(
		@kdID int
	)
RETURNS nvarchar(100)
BEGIN
	DECLARE @Name nvarchar(100)
	DECLARE @PublicID int
	SET @Name = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID)
	SET @PublicID = dbo.PublicID((SELECT SectorID FROM Kingdoms WHERE kdID = @kdID))
	IF @Name IS NULL
	BEGIN
		SET @Name = 'Nobody'
	END
	ELSE
	IF @Name = 'monkofdoom-'
	BEGIN
		SET @Name = 'monkofdoom <b><font color=#FF7700>(Mod)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'TZ'
	BEGIN
		SET @Name = 'TZ <b><font color=#10D7E9>(Admin)</font></b>'
	END
	ELSE
	IF @Name = 'AnonyPhish'
	BEGIN
	SET @Name = 'Kissah'
	SET @Name = @Name + ' <b><font color=#00ff00>(HAdmin)</font></b>'
	END
	ELSE
	IF @Name = 'Mystical Blitz SK'
	BEGIN
		SET @Name = 'Mystical Blitz'
		SET @Name = @Name + ' <b><font color=#FF7700>(Mod)</font></b>'
	END
	ELSE
	IF @Name = 'Link'
	BEGIN
		SET @Name = 'Link <b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	IF @Name = 'SuperShark'
	BEGIN
		SET @Name = 'hEaD <b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	IF @Name = 'Bedrock'
	BEGIN
		SET @Name = 'Bedrock <b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	BEGIN
		IF dbo.GetALB(@PublicID) = @kdID
		BEGIN
			SET @Name = '<i><u>' + @Name + '</u></i>'
		END
		ELSE
		BEGIN
			IF dbo.GetAALB(@PublicID) = @kdID SET @Name = '<i>' + @Name + '</i>'
		END
		SET @Name = @Name + (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF;">' + @Name + '</a>'
	END
END
	RETURN(@Name)
END
