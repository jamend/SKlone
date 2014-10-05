CREATE TABLE [dbo].[Publics] (
    [PublicID]   INT           IDENTITY (1, 1) NOT NULL,
    [PublicName] NVARCHAR (16) NOT NULL,
    [Password]   NVARCHAR (16) NOT NULL,
    [AL]         INT           NOT NULL,
    [AAL]        INT           NULL,
    [Dev]        INT           NULL,
    [Hadmin]     INT           NULL,
    [Admin]      INT           NULL,
    [War]        INT           NULL,
    [Peace]      INT           NULL,
    [Networth]   BIGINT        NULL,
    [Rank]       INT           NOT NULL
);

