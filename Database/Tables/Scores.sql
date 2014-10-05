CREATE TABLE [dbo].[Scores] (
    [kdID]             INT NOT NULL,
    [Kills]            INT CONSTRAINT [DF_Scores_Kills] DEFAULT (0) NULL,
    [PopStolen]        INT CONSTRAINT [DF_Scores_PopStolen] DEFAULT (0) NULL,
    [MoneyRobbed]      INT CONSTRAINT [DF_Scores_MoneyRobbed] DEFAULT (0) NULL,
    [HomesBurned]      INT CONSTRAINT [DF_Scores_HomesBurned] DEFAULT (0) NULL,
    [PPBurned]         INT CONSTRAINT [DF_Scores_PPBurned] DEFAULT (0) NULL,
    [UnitsKilled]      INT CONSTRAINT [DF_Scores_UnitsKilled] DEFAULT (0) NULL,
    [MissilesLaunched] INT CONSTRAINT [DF_Scores_MissilesLanched] DEFAULT (0) NULL,
    [LandFromAttacks]  INT CONSTRAINT [DF_Scores_LandFromAttacks] DEFAULT (0) NULL,
    [LargestGrab]      INT CONSTRAINT [DF_Scores_LarestGrab] DEFAULT (0) NULL
);

