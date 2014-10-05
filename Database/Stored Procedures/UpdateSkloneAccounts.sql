/****** Object:  Stored Procedure dbo.UpdateSkloneAccounts    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.UpdateSkloneAccounts
(
	@kdID int
)
 AS
DECLARE @KingdomName nvarchar(100)
DECLARE @Password nvarchar(100)
SET @KingdomName = (SELECT [Name] FROM Kingdoms WHERE kdID = @kdID)
SET @Password = (SELECT [Password] FROM Accounts WHERE kdID = @kdID)
INSERT INTO SKloneChat(UserName, [Password]) VALUES (@KingdomName, @Password)
