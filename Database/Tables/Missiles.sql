CREATE TABLE [dbo].[Missiles] (
    [kdID]            INT     NOT NULL,
    [Nuclear]         TINYINT CONSTRAINT [DF_Missiles_Nuclear] DEFAULT (0) NOT NULL,
    [NuclearBuilding] TINYINT CONSTRAINT [DF_Missiles_NuclearBuilding] DEFAULT (0) NOT NULL,
    [NuclearTime]     INT     CONSTRAINT [DF_Missiles_NuclearTime] DEFAULT (0) NOT NULL,
    [Fusion]          TINYINT CONSTRAINT [DF_Missiles_Fusion] DEFAULT (0) NOT NULL,
    [FusionBuilding]  TINYINT CONSTRAINT [DF_Missiles_FusionBuilding] DEFAULT (0) NOT NULL,
    [FusionTime]      INT     CONSTRAINT [DF_Missiles_FusionTime] DEFAULT (0) NOT NULL,
    [Energy]          TINYINT CONSTRAINT [DF_Missiles_Energy] DEFAULT (0) NOT NULL,
    [EnergyBuilding]  TINYINT CONSTRAINT [DF_Missiles_EnergyBuilding] DEFAULT (0) NOT NULL,
    [EnergyTime]      INT     CONSTRAINT [DF_Missiles_EnergyTime] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_Missiles] PRIMARY KEY CLUSTERED ([kdID] ASC)
);

