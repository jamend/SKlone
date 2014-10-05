CREATE TABLE [dbo].[AllianceNews] (
    [AllianceID] INT            NOT NULL,
    [NewsDate]   DATETIME       CONSTRAINT [DF_AllianceNews_NewsDate] DEFAULT (getdate()) NOT NULL,
    [NewsType]   TINYINT        NOT NULL,
    [NewsText]   NVARCHAR (250) NOT NULL
);

