CREATE TABLE [dbo].[Rewards] (
    [kdID]      INT NOT NULL,
    [Land]      INT CONSTRAINT [DF_Rewards_Land] DEFAULT (0) NULL,
    [LastLand]  INT NULL,
    [Money]     INT CONSTRAINT [DF_Rewards_Money] DEFAULT (0) NULL,
    [LastMoney] INT NULL
);

