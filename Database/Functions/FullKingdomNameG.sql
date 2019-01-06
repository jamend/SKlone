/****** Object:  User Defined Function dbo.FullKingdomNameG    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.FullKingdomNameG
	(
		@kdID int
	)
RETURNS nvarchar(100)
BEGIN
	DECLARE @Name nvarchar(100)
	DECLARE @PublicID int
	SET @Name = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID)
	SET @PublicID = dbo.PublicID((SELECT SectorID FROM Kingdoms WHERE kdID = @kdID))
	BEGIN
	IF @Name IS NULL
	BEGIN
		SET @Name = 'Nobody'
	END
	ELSE
	BEGIN
	IF @Name = 'monkofdoom-'
	BEGIN
		SET @Name = 'monkofdoom <br><b><font color=#FF7700>(Moderator)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'AnonyPhish'
	BEGIN
	SET @Name = 'Kissah'
	SET @Name = @Name + ' <b><font color=#00ff00>(HAdmin)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'Mystical Blitz SK'
	BEGIN
		SET @Name = 'Mystical Blitz'
		SET @Name = @Name + ' <br><b><font color=#FF7700>(Moderator)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'Link'
	BEGIN
		SET @Name = 'Link <br><b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	IF @Name = 'SuperShark'
	BEGIN
		SET @Name = 'hEaD <b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'Bedrock'
	BEGIN
		SET @Name = 'Bedrock <br><b><font color=#447cff>(Developer)</font></b>'
	END
	ELSE
	BEGIN
	IF @Name = 'TZ'
	BEGIN
		SET @Name = 'TZ <br><b><font color=#10D7E9>(Administrator)</font></b>'
	END
	ELSE
	BEGIN
		IF dbo.GetALB(@PublicID) = @kdID
		BEGIN
			SET @Name = '<i><u>' + @Name + '</u></i>'
		END
		ELSE
		BEGIN
			IF dbo.GetAALB(@PublicID) = @kdID 
				SET @Name = '<i>' + @Name + '</i>'
		END
		SET @Name = @Name + (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
		SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF;">' + @Name + '</a>'
	END
	END
	END
	END
	END
	END
	END
	END
	RETURN(@Name)
END
