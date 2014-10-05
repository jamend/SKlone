CREATE TABLE [dbo].[SignupIPs] (
    [SignupIP]   NVARCHAR (16) NOT NULL,
    [SignUpDate] DATETIME      CONSTRAINT [DF_SignupIPs_SignUpDate] DEFAULT (getdate()) NOT NULL,
    [kdID]       INT           NOT NULL,
    CONSTRAINT [PK_SignupIPs] PRIMARY KEY CLUSTERED ([SignupIP] ASC)
);

