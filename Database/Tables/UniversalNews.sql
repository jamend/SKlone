CREATE TABLE [dbo].[UniversalNews] (
    [PublicID] INT            CONSTRAINT [DF_UniversalNews_PublicID] DEFAULT (1) NOT NULL,
    [NewsDate] DATETIME       CONSTRAINT [DF_UniversalNews_NewsDate] DEFAULT (getdate()) NOT NULL,
    [NewsType] TINYINT        CONSTRAINT [DF_UniversalNews_NewsType] DEFAULT (7) NOT NULL,
    [NewsText] NVARCHAR (250) NOT NULL
);

