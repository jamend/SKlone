CREATE TABLE [dbo].[SKloneChat] (
    [UserName]     NVARCHAR (50) NULL,
    [Password]     NVARCHAR (50) NULL,
    [Email]        NVARCHAR (50) CONSTRAINT [DF_SKloneChat_Email] DEFAULT (N'blah') NULL,
    [Status]       TINYINT       CONSTRAINT [DF_SKloneChat_Status] DEFAULT (0) NULL,
    [Profile]      NVARCHAR (50) CONSTRAINT [DF_SKloneChat_Profile] DEFAULT (N'boo') NULL,
    [ProfileETC]   NVARCHAR (50) CONSTRAINT [DF_SKloneChat_ProfileETC] DEFAULT (N'boo') NULL,
    [EnterMSG]     NVARCHAR (50) CONSTRAINT [DF_SKloneChat_EnterMSG] DEFAULT (N'Entered.') NULL,
    [ExitMSG]      NVARCHAR (50) CONSTRAINT [DF_SKloneChat_ExitMSG] DEFAULT (N'Exited.') NULL,
    [Created]      NVARCHAR (50) CONSTRAINT [DF_SKloneChat_Created] DEFAULT (1 / 20 / 9) NULL,
    [ProfileStats] NVARCHAR (50) CONSTRAINT [DF_SKloneChat_ProfileStats] DEFAULT (N'boo') NULL,
    [Icon]         NVARCHAR (50) CONSTRAINT [DF_SKloneChat_Icon] DEFAULT (0) NULL,
    [kdID]         INT           NOT NULL
);

