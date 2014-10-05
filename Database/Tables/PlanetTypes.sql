CREATE TABLE [dbo].[PlanetTypes] (
    [PlanetType]          INT           IDENTITY (1, 1) NOT NULL,
    [PlanetTypeName]      NVARCHAR (24) NOT NULL,
    [PopulationFactor]    REAL          CONSTRAINT [DF_PlanetTypes_PopulationFactor] DEFAULT (1) NOT NULL,
    [ResearchFactor]      REAL          CONSTRAINT [DF_PlanetTypes_ResearchFactor] DEFAULT (1) NOT NULL,
    [ReturnTimeFactor]    REAL          CONSTRAINT [DF_PlanetTypes_ReturnTimeFactor] DEFAULT (1) NOT NULL,
    [IncomeFactor]        REAL          CONSTRAINT [DF_PlanetTypes_IncomeFactor] DEFAULT (1) NOT NULL,
    [PowerProducedFactor] REAL          CONSTRAINT [DF_PlanetTypes_PowerProducedFactor] DEFAULT (1) NOT NULL,
    [PowerNeededFactor]   REAL          CONSTRAINT [DF_PlanetTypes_PowerNeededFactor] DEFAULT (1) NOT NULL,
    [DefenceFactor]       REAL          CONSTRAINT [DF_PlanetTypes_DefenceFactor] DEFAULT (1) NOT NULL,
    [AttackFactor]        REAL          CONSTRAINT [DF_PlanetTypes_AttackFactor] DEFAULT (1) NOT NULL,
    [ProbeFactor]         REAL          CONSTRAINT [DF_PlanetTypes_ProbeFactor] DEFAULT (1) NOT NULL,
    [MilitaryCostFactor]  REAL          CONSTRAINT [DF_PlanetTypes_MilitaryCostFactor] DEFAULT (1) NOT NULL,
    CONSTRAINT [PK_PlanetTypes] PRIMARY KEY CLUSTERED ([PlanetType] ASC)
);

