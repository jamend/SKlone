﻿CREATE TABLE [dbo].[WLs] (
    [kdID]   INT     NOT NULL,
    [WLID]   TINYINT NOT NULL,
    [WLTime] TINYINT CONSTRAINT [DF_WLs_WLTime] DEFAULT (0) NULL,
    [WLOut]  BIT     CONSTRAINT [DF_WLs_WL1Out] DEFAULT (0) NOT NULL
);

