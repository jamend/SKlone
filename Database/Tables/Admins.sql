CREATE TABLE [dbo].[Admins] (
    [AdminID]   INT           IDENTITY (1, 1) NOT NULL,
    [Username]  NVARCHAR (24) NOT NULL,
    [Password]  NVARCHAR (24) NOT NULL,
    [AdminType] TINYINT       CONSTRAINT [DF_Admins_AdminType] DEFAULT (0) NOT NULL,
    [LoggedIn]  INT           NULL,
    [ForumID]   INT           CONSTRAINT [DF_Admins_ForumID] DEFAULT (0) NULL
);

