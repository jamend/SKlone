CREATE TABLE [dbo].[AllianceRelationTypes] (
    [RelationType]         TINYINT       NOT NULL,
    [Name]                 NVARCHAR (12) NOT NULL,
    [AttackGainBonus]      REAL          NOT NULL,
    [AttackStrengthBonus]  REAL          NOT NULL,
    [DefenceStrengthBonus] REAL          NOT NULL
);

