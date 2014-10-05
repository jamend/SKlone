CREATE TABLE [dbo].[RaceTypes] (
    [RaceType]            INT           IDENTITY (1, 1) NOT NULL,
    [RaceTypeName]        NVARCHAR (24) NOT NULL,
    [PopulationFactor]    REAL          CONSTRAINT [DF_RaceTypes_PopulationFactor] DEFAULT (0) NOT NULL,
    [ResearchFactor]      REAL          CONSTRAINT [DF_RaceTypes_ResearchFactor] DEFAULT (0) NOT NULL,
    [ReturnTimeFactor]    REAL          CONSTRAINT [DF_RaceTypes_ReturnTimefactor] DEFAULT (0) NOT NULL,
    [IncomeFactor]        REAL          CONSTRAINT [DF_RaceTypes_IncomeFactor] DEFAULT (0) NOT NULL,
    [PowerProducedFactor] REAL          CONSTRAINT [DF_RaceTypes_PowerProducedFactor] DEFAULT (0) NOT NULL,
    [PowerNeededFactor]   REAL          CONSTRAINT [DF_RaceTypes_PowerNeededFactor] DEFAULT (0) NOT NULL,
    [DefenceFactor]       REAL          CONSTRAINT [DF_RaceTypes_DefenceFactor] DEFAULT (0) NOT NULL,
    [AttackFactor]        REAL          CONSTRAINT [DF_RaceTypes_AttackFactor] DEFAULT (0) NOT NULL,
    [ProbeFactor]         REAL          CONSTRAINT [DF_RaceTypes_ProbeFactor] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_RaceTypes] PRIMARY KEY CLUSTERED ([RaceType] ASC)
);

