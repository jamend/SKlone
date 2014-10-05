CREATE TABLE [dbo].[UnitsOut] (
    [kdID]     INT     NOT NULL,
    [UnitType] TINYINT NOT NULL,
    [Out]      INT     CONSTRAINT [DF_UnitsOut_Out] DEFAULT (0) NOT NULL,
    [WLID]     TINYINT NOT NULL
);

