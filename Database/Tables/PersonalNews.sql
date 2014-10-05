CREATE TABLE [dbo].[PersonalNews] (
    [kdID]     INT            NOT NULL,
    [NewsText] NVARCHAR (512) NOT NULL,
    [NewsRead] BIT            CONSTRAINT [DF_PersonalNews_NewsRead] DEFAULT (0) NOT NULL,
    [NewsDate] DATETIME       CONSTRAINT [DF_PersonalNews_NewsDate] DEFAULT (getdate()) NOT NULL
);

