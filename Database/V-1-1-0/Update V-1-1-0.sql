USE [SistemaVentasDB]
GO

/****** Object:  Table [dbo].[tbl_Version]    Script Date: 04/07/2017 21:47:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Version](
	[versionMayor] [int] NOT NULL,
	[versionMenor] [int] NOT NULL,
	[patch] [int] NOT NULL
) ON [PRIMARY]

GO


DELETE FROM [dbo].[tbl_Version]
INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,1
           ,0)
GO

