/****** Object:  Stored Procedure dbo.kingdomIDs    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.kingdomIDs
AS
BEGIN
SELECT kdID, [Name] FROM Kingdoms
END
