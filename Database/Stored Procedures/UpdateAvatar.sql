/****** Object:  Stored Procedure dbo.UpdateAvatar    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UpdateAvatar
(
	@Avatar nvarchar(100),
	@kdID int,
	@Result nvarchar(100) output
)
 AS
		UPDATE Kingdoms SET  Avatar = @Avatar WHERE kdID = @kdID
		SET @Result = 'Your Profile has been successfully updated.'
		UPDATE Kingdoms SET Avatar = NULL WHERE Avatar = 'NoAvatar'
