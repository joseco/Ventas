USE [SistemaVentasDB]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductoById]    Script Date: 04/07/2017 21:34:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_GetProductoById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_GetProductoById]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductos]    Script Date: 04/07/2017 21:34:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_GetProductos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_GetProductos]
GO

/****** Object:  StoredProcedure [dbo].[usp_VENTA_GetVentas]    Script Date: 04/07/2017 21:34:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VENTA_GetVentas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_VENTA_GetVentas]
GO

/****** Object:  StoredProcedure [dbo].[usp_VENTA_RegistrarVenta]    Script Date: 04/07/2017 21:34:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VENTA_RegistrarVenta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_VENTA_RegistrarVenta]
GO


/****** Object:  UserDefinedTableType [dbo].[udt_Detalle]    Script Date: 04/07/2017 21:34:24 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_Detalle' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_Detalle]
GO

/****** Object:  UserDefinedTableType [dbo].[udt_Detalle]    Script Date: 04/07/2017 21:34:24 ******/
CREATE TYPE [dbo].[udt_Detalle] AS TABLE(
	[productoId] [int] NOT NULL,
	[precio] [decimal](12, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[subtotal] [decimal](12, 2) NOT NULL
)
GO



/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductoById]    Script Date: 04/07/2017 21:34:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 07/04/2017
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_GetProductoById]
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT [productoId]
      ,[nombre]
      ,[precio]
	FROM [dbo].[tbl_Producto]
	WHERE [productoId] = @intProductoId

    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductos]    Script Date: 04/07/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 07/04/2017
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_GetProductos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT [productoId]
      ,[nombre]
      ,[precio]
	FROM [dbo].[tbl_Producto]

    
END

GO

/****** Object:  StoredProcedure [dbo].[usp_VENTA_GetVentas]    Script Date: 04/07/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 07/04/2017
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_VENTA_GetVentas]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [ventaId]
		  ,[cliente]
		  ,[nit]
		  ,[fecha]
		  ,[total]
	FROM [dbo].[tbl_Venta]

END

GO

/****** Object:  StoredProcedure [dbo].[usp_VENTA_RegistrarVenta]    Script Date: 04/07/2017 21:34:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 07/04/2017
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_VENTA_RegistrarVenta]
	@intVentaId		INT OUTPUT,
	@varCliente		NVARCHAR(250),
	@varNit			NVARCHAR(50),
	@decTotal		DECIMAL(12,2),
	@tblDetalle		[dbo].[udt_Detalle] READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tbl_Venta]
           ([cliente]
           ,[nit]
           ,[fecha]
           ,[total])
     VALUES
           (@varCliente
           ,@varNit
           ,GETDATE()
           ,@decTotal)
           
    SET @intVentaId = SCOPE_IDENTITY()
    
    INSERT INTO [dbo].[tbl_Detalle]
    SELECT @intVentaId,
		[productoId],
		[precio],
		[cantidad],
		[subtotal]
	FROM @tblDetalle
    
END

GO


