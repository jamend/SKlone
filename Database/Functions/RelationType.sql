/****** Object:  User Defined Function dbo.RelationType    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.RelationType
	(
		@AllianceID int
	)
RETURNS nvarchar(96)
BEGIN
	DECLARE @Name nvarchar(96)
	DECLARE @War int
	DECLARE @Allie int
	DECLARE @Nap int
	DECLARE @Peace int
	SET @War = (SELECT War FROM Alliances WHERE AllianceID = @AllianceID)
	SET @Allie = (SELECT Allie FROM Alliances WHERE AllianceID = @AllianceID)
	SET @Nap = (SELECT Nap FROM Alliances WHERE AllianceID = @AllianceID)
	SET @Peace = (SELECT Peace FROM Alliances WHERE AllianceID = @AllianceID)
	IF @War != NULL
	BEGIN
		SET @Name = '' + dbo.AllianceName(@AllianceID) + ' (WAR)'
	END
	ELSE
	IF @Peace != NULL
	BEGIN
		SET @Name = '' + dbo.AllianceName(@AllianceID) + ' (PEACE)'
	END
	ELSE
	IF @Nap != NULL
	BEGIN
		SET @Name = '' + dbo.AllianceName(@AllianceID) + ' (NAP)'
	END
	ELSE
	IF @Allie != NULL
	BEGIN
		SET @Name = '' + dbo.AllianceName(@AllianceID) + ' (ALLY)'
	END
	ELSE
	IF @Allie = NULL AND @Nap = NULL AND @War = NULL AND @Peace = NULL
	BEGIN
		SET @Name = ' + dbo.AllianceName(@AllianceID) + '
	END
	RETURN(@Name)
END
