CREATE TABLE [dbo].[PublicForumsThreads] (
    [ThreadID]   INT          IDENTITY (1, 1) NOT NULL,
    [ThreadName] VARCHAR (50) NOT NULL,
    [Creator]    INT          NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_PublicForumsThreads_CreateDate] DEFAULT (getdate()) NOT NULL,
    [PublicID]   INT          NOT NULL,
    [Views]      INT          CONSTRAINT [DF_PublicForumsThreads_Views] DEFAULT (0) NOT NULL,
    [Locked]     TINYINT      CONSTRAINT [DF_PublicForumsThreads_Locked] DEFAULT (0) NOT NULL,
    [Sticky]     TINYINT      CONSTRAINT [DF_PublicForumsThreads_Sticky] DEFAULT (0) NULL
);

