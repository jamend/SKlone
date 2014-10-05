/****** Object:  Stored Procedure dbo.UsePower    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UsePower
	(
		@kdID as int,
		@Power as bigint
	)
AS
	IF (SELECT [Power] FROM Kingdoms WHERE kdID = @kdID) < @Power
	BEGIN
		RETURN(0) /* not enough power */
	END
	ELSE
	BEGIN
		UPDATE Kingdoms SET [Power] = [Power] - @Power WHERE kdID = @kdID
		RETURN(1) /* power used */
	END
