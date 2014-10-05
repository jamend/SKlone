/****** Object:  Stored Procedure dbo.SendMessage    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.SendMessage
	(
		@Message nvarchar(1024),
		@Recipient int,
		@Sender int
	)
AS
	INSERT INTO Messages(Message, Recipient, Sender) VALUES (@Message, @Recipient, @Sender)
	UPDATE AccountStatus SET MessagesSent = MessagesSent + 1 WHERE kdID = @Sender
