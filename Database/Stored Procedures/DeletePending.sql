/****** Object:  Stored Procedure dbo.DeletePending    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.DeletePending AS
	DECLARE @kdID int
	SET @kdID = (SELECT kdID FROM AccountStatus WHERE DeleteDate = 0)
	IF (SELECT DeleteDate FROM AccountStatus WHERE DeleteDate = 0) = 0
	BEGIN
	EXEC dbo.deletekingdom @kdID
	END
