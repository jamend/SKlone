CREATE TABLE [dbo].[PublicForumsPosts] (
    [PostID]   INT             IDENTITY (1, 1) NOT NULL,
    [PostText] NVARCHAR (2000) NOT NULL,
    [Poster]   INT             NOT NULL,
    [PostDate] DATETIME        CONSTRAINT [DF_PublicForumsPosts_PostDate] DEFAULT (getdate()) NOT NULL,
    [ThreadID] INT             NOT NULL,
    [Locked]   TINYINT         NULL
);

