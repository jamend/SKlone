CREATE TABLE [dbo].[Shields] (
    [kdID]            INT     NOT NULL,
    [MilitaryPercent] TINYINT CONSTRAINT [DF_Shields_MilitaryPercent] DEFAULT (0) NOT NULL,
    [MilitaryUsage]   TINYINT CONSTRAINT [DF_Shields_MilitaryUsage_1] DEFAULT (100) NOT NULL,
    [MissilePercent]  TINYINT CONSTRAINT [DF_Shields_MissilePercent] DEFAULT (0) NOT NULL,
    [MissileUsage]    TINYINT CONSTRAINT [DF_Shields_MissileUsage_1] DEFAULT (0) NOT NULL,
    [PowerUsage]      INT     CONSTRAINT [DF_Shields_PowerUsage] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_Shields] PRIMARY KEY CLUSTERED ([kdID] ASC)
);

