CREATE TABLE [dbo].[Profiles] (
    [kdID]        INT           NOT NULL,
    [MemberTitle] NVARCHAR (50) CONSTRAINT [DF_Profiles_MemberTitle] DEFAULT (N'User') NULL,
    [GroupName]   NVARCHAR (50) CONSTRAINT [DF_Profiles_GroupName] DEFAULT (N'User') NULL,
    [RealName]    NVARCHAR (24) NULL,
    [Location]    NVARCHAR (50) NULL,
    [Birth]       NVARCHAR (50) NULL,
    [WebSite]     NVARCHAR (50) NULL,
    [Occupation]  NVARCHAR (50) NULL,
    [Interests]   NVARCHAR (50) NULL,
    [Email]       NVARCHAR (50) NULL,
    [MSN]         NVARCHAR (50) NULL,
    [AIM]         NVARCHAR (50) NULL,
    [Yahoo]       NVARCHAR (50) NULL,
    [ICQNumber]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED ([kdID] ASC)
);

