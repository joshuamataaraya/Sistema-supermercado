USE [Multimedial]
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarProducto]    Script Date: 14/10/2015 22:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fernando Molina
-- Create date: 11 de octubre
-- Description:	Modifica un producto en el inventario.
-- =============================================
ALTER PROCEDURE [dbo].[sp_modificarProducto]
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
