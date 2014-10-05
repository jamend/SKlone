/****** Object:  User Defined Function dbo.FullKingdomNameE    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullKingdomNameE
	(
		@kdID int
	)
RETURNS nvarchar(100)
BEGIN
	DECLARE @Name nvarchar(100)
	DECLARE @AllianceID int
	SET @Name = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID)
	SET @AllianceID = dbo.AllianceID((SELECT SectorID FROM Kingdoms WHERE kdID = @kdID))
	IF @Name = Null
	BEGIN
		SET @Name = 'Nobody'
	END
	ELSE
	BEGIN
		IF dbo.GetAL(@AllianceID) = @kdID
		BEGIN
			SET @Name = '<i><u>' + @Name + '</u></i>'
			SET @Name = @Name + (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
			SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF;">' + @Name + '</a>'
		END
		ELSE
		BEGIN
			IF dbo.GetAAL(@AllianceID) = @kdID 
		BEGIN
			SET @Name = '<i>' + @Name + '</i>'
			SET @Name = @Name + (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
			SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF;">' + @Name + '</a>'
		END
		ELSE
		BEGIN
		SET @Name = @Name + (SELECT ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')' FROM Kingdoms, Sectors WHERE Kingdoms.kdID = @kdID AND Sectors.SectorID = Kingdoms.SectorID)
		SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF;">' + @Name + '</a>'
	END
	END
	END
	RETURN(@Name)
END
