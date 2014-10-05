CREATE TABLE [dbo].[ErrorLog] (
    [ErrorID]   INT             IDENTITY (1, 1) NOT NULL,
    [ErrorDate] DATETIME        CONSTRAINT [DF_ErrorLog_ErrorDate] DEFAULT (getdate()) NULL,
    [Message]   NVARCHAR (256)  NULL,
    [Stack]     NVARCHAR (1024) NULL,
    [kdID]      INT             NULL,
    [LoggedIn]  BIT             NULL,
    [RawURL]    NVARCHAR (256)  NULL
);

