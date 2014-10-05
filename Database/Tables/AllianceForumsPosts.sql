CREATE TABLE [dbo].[AllianceForumsPosts] (
    [PostID]   INT             IDENTITY (1, 1) NOT NULL,
    [PostText] NVARCHAR (2000) NOT NULL,
    [Poster]   INT             NOT NULL,
    [PostDate] DATETIME        CONSTRAINT [DF_AllianceForumsPosts_PostDate] DEFAULT (getdate()) NOT NULL,
    [ThreadID] INT             NOT NULL,
    CONSTRAINT [PK_AllianceForumsPosts] PRIMARY KEY CLUSTERED ([PostID] ASC),
    CONSTRAINT [FK_AllianceForumsPosts_AllianceForumsThreads] FOREIGN KEY ([ThreadID]) REFERENCES [dbo].[AllianceForumsThreads] ([ThreadID]),
    CONSTRAINT [FK_AllianceForumsPosts_Profiles] FOREIGN KEY ([Poster]) REFERENCES [dbo].[Profiles] ([kdID])
);

