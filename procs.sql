USE [Multimedial]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarProductos]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Inserta un nuevo producto en el inventario. Si la marca expecificada no existe, la crea.
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarProductos]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  p.Id, p.Nombre, m.Nombre as Marca, p.Descripcion, 
			i.Cantidad, i.Costo, i.PrecioFinal, i.DescuentoMaximo, i.Foto
	FROM Productos p, inventario i, Marcas m
	WHERE p.Id=i.IdProducto and p.IdMarca = m.Id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_consultarRecetas]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Consulta todas las recetas
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarRecetas]
	@pIdProduct int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  r.Id as IdReceta, r.Nombre as NombreReceta, r.Descripcion, p.Id as IdProducto, p.Nombre as NombreProducto
	FROM Recetas r, RecetaXProducto rp, Productos p
	WHERE p.Id=rp.IdProducto and r.Id = rp.IdReceta and p.Id=@pIdProduct
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getPhoto]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getPhoto]
	@id int
as
BEGIN
	SET NOCOUNT ON;
	SELECT i.Foto FROM Inventario i WHERE i.IdProducto=@id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertarProducto]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Inserta un nuevo producto en el inventario. Si la marca expecificada no existe, la crea.
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertarProducto]
	@pNombre varchar(20), @pMarca varchar(30), @pDescripcion varchar(200),
	@pCantidad int, @pCosto money, @pPrecioFinal money, @pDescuentoMaximo int,
	@pFoto VARCHAR(MAX)=NULL
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT Id FROM Marcas where Nombre=@pMarca)
	BEGIN
		INSERT INTO Marcas VALUES (@pMarca)
	END
	INSERT INTO Productos 
		VALUES(	@pNombre, 
				(SELECT Id FROM Marcas WHERE Nombre = @pMarca),
				@pDescripcion)
		INSERT INTO Inventario
		VALUES(@pCantidad, @pCosto, @pPrecioFinal, @pDescuentoMaximo,convert(varbinary(Max),@pFoto,2))
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insertarReceta]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Inserta una nueva receta. Recibe hasta 5 productos que incluye la receta
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertarReceta]
	@pNombre varchar(50), @pDescripcion varchar(MAX),
	@pNombreProducto varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Recetas
	VALUES(@pNombre, @pDescripcion)

	DECLARE @IdReceta int = @@IDENTITY 

	INSERT INTO RecetaXProducto 
	VALUES(@IdReceta, (SELECT  p.Id FROM PRODUCTOS p WHERE P.Nombre=@pNombreProducto))

END


GO
/****** Object:  StoredProcedure [dbo].[sp_modificarProducto]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Modifica un producto en el inventario.
-- =============================================
CREATE PROCEDURE [dbo].[sp_modificarProducto]
	@pIdProducto int, @pNombre varchar(20), @pMarca varchar(30), @pDescripcion varchar(200),
	@pCantidad int, @pCosto money, @pPrecioFinal money, @pDescuentoMaximo int,
	@pFoto varchar(MAX)=null
AS
BEGIN
	
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT Id FROM Marcas where Nombre=@pMarca)
	BEGIN
		INSERT INTO Marcas VALUES (@pMarca)
	END
	UPDATE Productos 
	SET Nombre=@pNombre, 
		IdMarca = (SELECT Id FROM Marcas WHERE Nombre = @pMarca),
		Descripcion = @pDescripcion
	WHERE Id = @pIdProducto

	IF @pFoto IS NULL
	BEGIN
		UPDATE Inventario
		SET Cantidad=@pCantidad, 
			Costo = @pCosto, 
			PrecioFinal = @pPrecioFinal, 
			DescuentoMaximo=@pDescuentoMaximo
		WHERE IdProducto=@pIdProducto
	END
	ELSE
	BEGIN
		UPDATE Inventario
		SET Cantidad=@pCantidad, 
			Costo = @pCosto, 
			PrecioFinal = @pPrecioFinal, 
			DescuentoMaximo=@pDescuentoMaximo,
			Foto = convert(varbinary(max), @pFoto, 2)
		WHERE IdProducto=@pIdProducto
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_modificarReceta]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Modifica una receta. Recibe hasta 5 productos que incluye la receta
-- =============================================
CREATE PROCEDURE [dbo].[sp_modificarReceta]
	@pIdReceta int, @pNombre varchar(50), @pDescripcion varchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Recetas
	SET Nombre = @pNombre, 
		Descripcion = @pDescripcion 
	WHERE Id = @pIdReceta
END


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerProducto]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Inserta un nuevo producto en el inventario. Si la marca expecificada no existe, la crea.
-- =============================================
create PROCEDURE [dbo].[sp_obtenerProducto]
	@pId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  p.Id, p.Nombre, m.Nombre as Marca, p.Descripcion, 
			i.Cantidad, i.Costo, i.PrecioFinal, i.DescuentoMaximo, i.Foto
	FROM Productos p, inventario i, Marcas m
	WHERE p.Id=i.IdProducto and p.IdMarca = m.Id and p.Id=@pId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerReceta]    Script Date: 16/10/2015 08:57:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 15 de octubre
-- Description:	Consulta todas las recetas
-- =============================================
CREATE PROCEDURE [dbo].[sp_obtenerReceta]
	@pIdReceta int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  r.Id as IdReceta, r.Nombre as NombreReceta, r.Descripcion as Descripcion
	FROM Recetas r
	WHERE r.Id=@pIdReceta
END


GO
