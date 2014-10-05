CREATE TABLE [dbo].[SectorForumsThreads] (
    [ThreadID]   INT          IDENTITY (1, 1) NOT NULL,
    [ThreadName] VARCHAR (50) NOT NULL,
    [Creator]    INT          NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_SectorForumsThreads_CreateDate] DEFAULT (getdate()) NOT NULL,
    [SectorID]   INT          NOT NULL,
    [Views]      INT          CONSTRAINT [DF_SectorForumsThreads_Views] DEFAULT (0) NOT NULL
);

