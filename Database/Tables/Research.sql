CREATE TABLE [dbo].[Research] (
    [kdID]            INT     NOT NULL,
    [ResearchType]    TINYINT NOT NULL,
    [ResearchPercent] REAL    CONSTRAINT [DF_Research_ResearchPercent] DEFAULT (0) NOT NULL,
    [Points]          BIGINT  CONSTRAINT [DF_Research_Points] DEFAULT (0) NOT NULL,
    [Scientists]      INT     CONSTRAINT [DF_Research_Scientists] DEFAULT (0) NOT NULL
);

