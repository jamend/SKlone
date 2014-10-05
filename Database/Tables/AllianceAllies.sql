CREATE TABLE [dbo].[AllianceAllies] (
    [AllianceID] INT NOT NULL,
    [AllieID]    INT NULL,
    [Pending]    BIT CONSTRAINT [DF_AllianceAllies_Pending] DEFAULT (0) NOT NULL,
    [Requester]  INT NULL
);

