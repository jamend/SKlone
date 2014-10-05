/****** Object:  Stored Procedure dbo.LogIn    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.LogIn
	(
		@kdID int,
		@LogInIP nvarchar(16)
	)
AS
	UPDATE AccountStatus SET Inactive = 0 WHERE Inactive = 1 AND kdID = @kdID
	INSERT LogIns (LogInIP, LogInDate, kdID) VALUES (@LogInIP, GETDATE(), @kdID)
