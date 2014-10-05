CREATE TABLE [dbo].[AdminForumThreads] (
    [ThreadID]   INT          IDENTITY (1, 1) NOT NULL,
    [ThreadName] VARCHAR (50) NOT NULL,
    [Creator]    INT          NOT NULL,
    [CreateDate] DATETIME     CONSTRAINT [DF_AdminForumThreadPosts_CreateDate] DEFAULT (getdate()) NOT NULL,
    [ForumID]    INT          NOT NULL,
    [Views]      INT          CONSTRAINT [DF_AdminForumThreadPosts_Views] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_AdminForumThreads] PRIMARY KEY CLUSTERED ([ThreadID] ASC)
);

