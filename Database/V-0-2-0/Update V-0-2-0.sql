USE [SistemaVentasDB]
GO

/****** Object:  Table [dbo].[tbl_Producto]    Script Date: 04/04/2017 21:46:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Producto](
	[productoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[precio] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_tbl_Producto] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[tbl_Detalle]    Script Date: 04/04/2017 21:46:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Detalle](
	[ventaId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[precio] [decimal](12, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[subtotal] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_tbl_Detalle] PRIMARY KEY CLUSTERED 
(
	[ventaId] ASC,
	[productoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Detalle_tbl_Producto] FOREIGN KEY([productoId])
REFERENCES [dbo].[tbl_Producto] ([productoId])
GO

ALTER TABLE [dbo].[tbl_Detalle] CHECK CONSTRAINT [FK_tbl_Detalle_tbl_Producto]
GO

ALTER TABLE [dbo].[tbl_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Detalle_tbl_Venta] FOREIGN KEY([ventaId])
REFERENCES [dbo].[tbl_Venta] ([ventaId])
GO

ALTER TABLE [dbo].[tbl_Detalle] CHECK CONSTRAINT [FK_tbl_Detalle_tbl_Venta]
GO


