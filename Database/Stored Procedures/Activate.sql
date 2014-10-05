/****** Object:  Stored Procedure dbo.Activate    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE PROCEDURE dbo.Activate
	(
		@kdID int,
		@ActivationCode bigint
	)
AS
	IF (SELECT Activated FROM Activation WHERE kdID = @kdID) = 1
	BEGIN
		RETURN(0) /* already activated */
	END
	ELSE
	BEGIN
		IF (SELECT ActivationCode FROM Activation WHERE kdID = @kdID) = @ActivationCode
		BEGIN
			UPDATE Activation SET Activated = 1 WHERE kdID = @kdID
			RETURN(2) /* activated */
		END
		ELSE
		BEGIN
			RETURN(1) /* bad code */
		END
	END
