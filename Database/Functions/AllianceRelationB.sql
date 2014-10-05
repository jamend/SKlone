/****** Object:  User Defined Function dbo.AllianceRelationB    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.AllianceRelationB
	(
		@Sector1 int,
		@Sector2 int
	)
RETURNS int
BEGIN
	DECLARE @Sector1Alliance int
	DECLARE @Sector2Alliance int
	DECLARE @Sector1AllianceB int
	DECLARE @Sector2AllianceB int
	DECLARE @Result int
	SET @Sector1Alliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @Sector1)
	SET @Sector2Alliance = (SELECT AllianceID FROM Sectors WHERE SectorID = @Sector2)
	SET @Sector1AllianceB = (SELECT AllianceID FROM Sectors WHERE SectorID = @Sector1 AND AllianceID != 0)
	SET @Sector2AllianceB = (SELECT AllianceID FROM Sectors WHERE SectorID = @Sector2 AND AllianceID != 0)
	IF (@Sector1Alliance = Null) OR (@Sector2Alliance = Null) 
	BEGIN
		SET @Result = 0 /* no relation */
	END
	ELSE
	IF (SELECT War FROM Alliances WHERE AllianceID = @Sector1Alliance) = @Sector2Alliance 
	BEGIN
		SET @Result = 1 /* war */
	END
	ELSE
	IF (SELECT Peace FROM Alliances WHERE AllianceID = @Sector1Alliance) = @Sector2Alliance 
	BEGIN
		SET @Result = 2 /* peace */
	END
	ELSE
	IF (@Result = Null) 
	BEGIN
		SET @Result = 0 /* no relation */
	END
	RETURN(@Result)
END
