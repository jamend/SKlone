CREATE TABLE [dbo].[AdminForumPosts] (
    [PostID]   INT             IDENTITY (1, 1) NOT NULL,
    [PostText] NVARCHAR (2000) NOT NULL,
    [Poster]   INT             NOT NULL,
    [PostDate] DATETIME        CONSTRAINT [DF_AdminForumPosts_PostDate] DEFAULT (getdate()) NOT NULL,
    [ThreadID] INT             NOT NULL,
    CONSTRAINT [PK_AdminForumPosts] PRIMARY KEY CLUSTERED ([PostID] ASC),
    CONSTRAINT [FK_AdminForumPosts_AdminForumThreads] FOREIGN KEY ([ThreadID]) REFERENCES [dbo].[AdminForumThreads] ([ThreadID])
);

