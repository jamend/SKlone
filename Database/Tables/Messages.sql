CREATE TABLE [dbo].[Messages] (
    [Message]     NVARCHAR (1500) NOT NULL,
    [Recipient]   INT             NOT NULL,
    [Sender]      INT             NULL,
    [DateSent]    DATETIME        CONSTRAINT [DF_Messages_DateSent] DEFAULT (getdate()) NOT NULL,
    [MessageRead] BIT             CONSTRAINT [DF_Messages_MessageRead] DEFAULT (0) NOT NULL,
    [MessageID]   INT             IDENTITY (1, 1) NOT NULL
);

