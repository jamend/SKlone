/****** Object:  Stored Procedure dbo.ReturnSoldiers    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.ReturnSoldiers
AS
		DECLARE @Soldiers int
		DECLARE @Soldiers1 int
		DECLARE @Soldiers2 int
		DECLARE @Soldiers3 int
		SET @Soldiers = (SELECT COUNT([Out]) FROM UnitsOut WHERE UnitType = 0 AND WLID = 0  AND (SELECT COUNT(*) FROM Accounts WHERE kdID = UnitsOut.kdID) > 0)
		SET @Soldiers1 = (SELECT [Out] FROM UnitsOut WHERE UnitType = 0 AND WLID = 1  AND kdID = (SELECT COUNT(kdID) FROM UnitsTraining))
		SET @Soldiers2 = (SELECT [Out] FROM UnitsOut WHERE UnitType = 0 AND WLID = 2  AND kdID = (SELECT COUNT(kdID) FROM UnitsTraining))
		SET @Soldiers3 = (SELECT [Out] FROM UnitsOut WHERE UnitType = 0 AND WLID = 3 AND kdID = (SELECT COUNT(kdID) FROM UnitsTraining))
		IF @Soldiers IS NULL
		BEGIN
		SET @Soldiers = 0
		END
		IF @Soldiers1 IS NULL
		BEGIN
		SET @Soldiers1 = 0
		END
		IF @Soldiers2 IS NULL
		BEGIN
		SET @Soldiers2 = 0
		END
		IF @Soldiers3 IS NULL
		BEGIN
		SET @Soldiers3 = 0
		END
		UPDATE UnitsTraining SET Complete = Complete + @Soldiers  WHERE UnitType = 0 AND (SELECT COUNT(*) FROM Accounts WHERE kdID = UnitsTraining.kdID) > 0
		UPDATE UnitsTraining SET Complete = Complete + @Soldiers1  WHERE UnitType = 0 AND (SELECT COUNT(*) FROM Accounts WHERE kdID = UnitsTraining.kdID) > 0
		UPDATE UnitsTraining SET Complete = Complete + @Soldiers2  WHERE UnitType = 0 AND (SELECT COUNT(*) FROM Accounts WHERE kdID = UnitsTraining.kdID) > 0
		UPDATE UnitsTraining SET Complete = Complete + @Soldiers3  WHERE UnitType = 0 AND (SELECT COUNT(*) FROM Accounts WHERE kdID = UnitsTraining.kdID) > 0
