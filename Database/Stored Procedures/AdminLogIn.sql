/****** Object:  Stored Procedure dbo.AdminLogIn    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.AdminLogIn
	(
		@AdminID int,
		@LogInIP nvarchar(16)
	)
AS
	DECLARE @AdminUser nvarchar(200)
	SET @AdminUser = (SELECT UserName FROM Admins WHERE AdminID = @AdminID)
	INSERT AdminLogins (LoginIP, LoginDate, LoginUser) VALUES (@LogInIP, GETDATE(), @AdminUser)
