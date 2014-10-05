CREATE TABLE [dbo].[AllianceForumsThreads] (
    [ThreadID]   INT          IDENTITY (1, 1) NOT NULL,
    [ThreadName] VARCHAR (50) NOT NULL,
    [Creator]    INT          NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_AllianceForumsThreads_CreateDate] DEFAULT (getdate()) NOT NULL,
    [AllianceID] INT          NOT NULL,
    [Views]      INT          CONSTRAINT [DF_AllianceForumsThreads_Views] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_AllianceForumsThreads] PRIMARY KEY CLUSTERED ([ThreadID] ASC)
);

