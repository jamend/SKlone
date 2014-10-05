CREATE TABLE [dbo].[Alliances] (
    [AllianceID]      INT            IDENTITY (1, 1) NOT NULL,
    [AllianceName]    NVARCHAR (16)  NOT NULL,
    [Password]        NVARCHAR (16)  NULL,
    [AllianceMessage] NVARCHAR (200) CONSTRAINT [DF_Alliances_AllianceMessage] DEFAULT (N'Welcome to the alliance.') NULL,
    [AL]              INT            NOT NULL,
    [AAL]             INT            NULL,
    [War]             INT            NULL,
    [Peace]           INT            NULL,
    [Nap]             INT            NULL,
    [NapPending]      INT            NULL,
    [NapSender]       INT            NULL,
    [Allie]           INT            NULL,
    [AlliePending]    INT            NULL,
    [AllieSender]     INT            NULL,
    [Networth]        BIGINT         CONSTRAINT [DF_Alliances_Networth] DEFAULT (0) NULL,
    [AverageNetworth] BIGINT         CONSTRAINT [DF_Alliances_AverageNetworth] DEFAULT (0) NULL,
    [Rank]            INT            CONSTRAINT [DF_Alliances_Rank] DEFAULT (0) NOT NULL,
    [AllianceID2]     INT            CONSTRAINT [DF_Alliances_AllianceID2] DEFAULT (1) NOT NULL,
    [WarStatus]       INT            NULL
);

