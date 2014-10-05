CREATE TABLE [dbo].[ServerStatus] (
    [Offline]     BIT      CONSTRAINT [DF_ServerStatus_Offline] DEFAULT (0) NOT NULL,
    [SignupsOpen] INT      CONSTRAINT [DF_ServerStatus_SignupsOpen] DEFAULT (1) NOT NULL,
    [NotStarted]  BIT      CONSTRAINT [DF_ServerStatus_NotStarted] DEFAULT (1) NOT NULL,
    [StartDate]   DATETIME NULL,
    [EndGame]     BIT      NULL,
    [EndDate]     DATETIME NULL,
    [MaxPlayers]  INT      NULL
);

