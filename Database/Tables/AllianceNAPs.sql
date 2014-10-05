CREATE TABLE [dbo].[AllianceNAPs] (
    [AllianceID] INT NOT NULL,
    [NAPID]      INT NULL,
    [Pending]    BIT CONSTRAINT [DF_AllianceNAPs_Pending] DEFAULT (0) NOT NULL,
    [Requester]  INT NULL
);

