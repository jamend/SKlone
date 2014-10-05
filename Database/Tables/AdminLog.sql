CREATE TABLE [dbo].[AdminLog] (
    [LogID]     INT             NOT NULL,
    [LogDate]   DATETIME        CONSTRAINT [DF_AdminLog_LogDate] DEFAULT (getdate()) NULL,
    [LogAction] NVARCHAR (1024) NULL,
    [Name]      NVARCHAR (1024) NULL
);

