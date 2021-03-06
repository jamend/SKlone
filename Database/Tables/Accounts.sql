﻿CREATE TABLE [dbo].[Accounts] (
    [kdID]     INT            IDENTITY (1, 1) NOT NULL,
    [Account]  NVARCHAR (32)  NOT NULL,
    [Password] NVARCHAR (64)  NOT NULL,
    [Email]    NVARCHAR (256) NOT NULL,
	[LastMoneyReward] [datetime] NOT NULL DEFAULT (dateadd(day,(-1),getdate())),
	[LastLandReward] [datetime] NOT NULL DEFAULT (dateadd(day,(-1),getdate())),
    CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED ([kdID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Accounts]
    ON [dbo].[Accounts]([kdID] ASC);

