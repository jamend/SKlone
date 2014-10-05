/****** Object:  User Defined Function dbo.FamilyName    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FamilyName
	(
		@FamilyID int
	)
RETURNS nvarchar(24)
BEGIN
	DECLARE @Result nvarchar(24)
	IF @FamilyID = 0
	BEGIN
		SET @Result = 'None'
	END
	ELSE
	BEGIN
		SET @Result = '' + (SELECT AllianceName FROM Alliances WHERE AllianceID = @FamilyID) + ''
	END
	RETURN(@Result)
END
