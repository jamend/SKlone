CREATE TABLE [dbo].[Activation] (
    [kdID]               INT     NOT NULL,
    [Activated]          BIT     CONSTRAINT [DF_Activation_Activated] DEFAULT (1) NOT NULL,
    [ActivationCode]     BIGINT  NOT NULL,
    [ActivationAttempts] TINYINT CONSTRAINT [DF_Activation_ActivationAttempts] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_Activation] PRIMARY KEY CLUSTERED ([kdID] ASC)
);

