CREATE TABLE [dbo].[AdminForums] (
    [ForumID]   INT           NOT NULL,
    [AL]        INT           NULL,
    [AAL]       INT           NULL,
    [Dev]       INT           NULL,
    [Hadmin]    INT           NULL,
    [Admin]     INT           NULL,
    [ForumName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AdminForums] PRIMARY KEY CLUSTERED ([ForumID] ASC)
);

