CREATE TABLE [dbo].[Sectors] (
    [SectorID]      INT            IDENTITY (1, 1) NOT NULL,
    [SectorOpen]    TINYINT        CONSTRAINT [DF_Sectors_SectorOpen] DEFAULT (0) NOT NULL,
    [Galaxy]        TINYINT        NOT NULL,
    [Sector]        TINYINT        NOT NULL,
    [GalaxySector]  NVARCHAR (50)  NULL,
    [SectorName]    NVARCHAR (48)  CONSTRAINT [DF_Sectors_SectorName] DEFAULT (N'(sector name not set)') NOT NULL,
    [SectorMessage] NVARCHAR (256) CONSTRAINT [DF_Sectors_SectorMessage] DEFAULT (N'Welcome to this sector!') NOT NULL,
    [AllianceID]    INT            CONSTRAINT [DF_Sectors_AllianceID] DEFAULT (0) NOT NULL,
    [PublicID]      INT            CONSTRAINT [DF_Sectors_PublicID] DEFAULT (1) NULL,
    [GroupSignUp]   INT            CONSTRAINT [DF_Sectors_GroupSignUp] DEFAULT (0) NOT NULL,
    [GroupPassword] NVARCHAR (50)  CONSTRAINT [DF_Sectors_GroupPassword] DEFAULT (N'sklone') NOT NULL,
    [AllianceWait]  INT            CONSTRAINT [DF_Sectors_AllianceWait] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED ([SectorID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Sectors]
    ON [dbo].[Sectors]([SectorID] ASC);

