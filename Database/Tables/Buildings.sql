CREATE TABLE [dbo].[Buildings] (
    [kdID]           INT     NOT NULL,
    [BuildingType]   TINYINT NOT NULL,
    [Built]          INT     CONSTRAINT [DF_Buildings_Buildings] DEFAULT (0) NOT NULL,
    [Construction0]  INT     CONSTRAINT [DF_Buildings_Construction0] DEFAULT (0) NOT NULL,
    [Construction1]  INT     CONSTRAINT [DF_Buildings_Construction1] DEFAULT (0) NOT NULL,
    [Construction2]  INT     CONSTRAINT [DF_Buildings_Construction2] DEFAULT (0) NOT NULL,
    [Construction3]  INT     CONSTRAINT [DF_Buildings_Construction3] DEFAULT (0) NOT NULL,
    [Construction4]  INT     CONSTRAINT [DF_Buildings_Construction4] DEFAULT (0) NOT NULL,
    [Construction5]  INT     CONSTRAINT [DF_Buildings_Construction5] DEFAULT (0) NOT NULL,
    [Construction6]  INT     CONSTRAINT [DF_Buildings_Construction6] DEFAULT (0) NOT NULL,
    [Construction7]  INT     CONSTRAINT [DF_Buildings_Construction7] DEFAULT (0) NOT NULL,
    [Construction8]  INT     CONSTRAINT [DF_Buildings_Construction8] DEFAULT (0) NOT NULL,
    [Construction9]  INT     CONSTRAINT [DF_Buildings_Construction9] DEFAULT (0) NOT NULL,
    [Construction10] INT     CONSTRAINT [DF_Buildings_Construction10] DEFAULT (0) NOT NULL,
    [Construction11] INT     CONSTRAINT [DF_Buildings_Construction11] DEFAULT (0) NOT NULL,
    [Construction12] INT     CONSTRAINT [DF_Buildings_Construction12] DEFAULT (0) NOT NULL,
    [Construction13] INT     CONSTRAINT [DF_Buildings_Construction13] DEFAULT (0) NOT NULL,
    [Construction14] INT     CONSTRAINT [DF_Buildings_Construction14] DEFAULT (0) NOT NULL,
    [Construction15] INT     CONSTRAINT [DF_Buildings_Construction15] DEFAULT (0) NOT NULL
);

