/****** Object:  User Defined Function dbo.FullSirName    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullSirName
	(
		@kdID int
	)
RETURNS nvarchar(48)
BEGIN
	DECLARE @Name nvarchar(48)
	DECLARE @PublicID int
	SET @Name = (SELECT RulerName FROM Kingdoms WHERE kdID = @kdID)
	SET @PublicID = dbo.PublicID((SELECT SectorID FROM Kingdoms WHERE kdID = @kdID))
	IF @Name = Null
	BEGIN
		SET @Name = 'Nobody'
	END
	ELSE
	IF @Name = 'Link'
	BEGIN
		SET @Name = 'Master Link'
	END
	ELSE
	IF @Name = 'lord galactica'
	BEGIN
		SET @Name = 'sir hEaD'
	END
	ELSE
	BEGIN
		IF dbo.GetAL(@PublicID) = @kdID
		BEGIN
			SET @Name = '' + @Name + ''
		END
		ELSE
		BEGIN
			IF dbo.GetAAL(@PublicID) = @kdID SET @Name = '' + @Name + ''
		END
		SET @Name = @Name
	END
	RETURN(@Name)
END
