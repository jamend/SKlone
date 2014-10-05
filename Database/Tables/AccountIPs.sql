CREATE TABLE [dbo].[AccountIPs] (
    [AccountIP] NVARCHAR (50) NOT NULL,
    [kdID]      INT           NOT NULL,
    CONSTRAINT [PK_AccountIPs] PRIMARY KEY CLUSTERED ([AccountIP] ASC)
);

