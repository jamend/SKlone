CREATE TABLE [dbo].[SectorNews] (
    [SectorID] INT            NOT NULL,
    [NewsDate] DATETIME       CONSTRAINT [DF_SectorNews_NewsDate] DEFAULT (getdate()) NOT NULL,
    [NewsType] TINYINT        NOT NULL,
    [NewsText] NVARCHAR (250) NOT NULL
);

