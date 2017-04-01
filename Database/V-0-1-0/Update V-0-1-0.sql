USE [SistemaVentasDB]
GO

/****** Object:  Table [dbo].[tbl_Venta]    Script Date: 03/31/2017 21:33:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Venta](
	[ventaId] [int] IDENTITY(1,1) NOT NULL,
	[cliente] [nvarchar](250) NOT NULL,
	[nit] [nvarchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[total] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_tbl_Venta] PRIMARY KEY CLUSTERED 
(
	[ventaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


