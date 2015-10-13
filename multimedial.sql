USE [master]
GO
/****** Object:  Database [Multimedial]    Script Date: 11/10/2015 16:24:13 ******/
CREATE DATABASE [Multimedial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Multimedial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Multimedial.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Multimedial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Multimedial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Multimedial] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Multimedial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Multimedial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Multimedial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Multimedial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Multimedial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Multimedial] SET ARITHABORT OFF 
GO
ALTER DATABASE [Multimedial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Multimedial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Multimedial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Multimedial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Multimedial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Multimedial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Multimedial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Multimedial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Multimedial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Multimedial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Multimedial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Multimedial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Multimedial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Multimedial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Multimedial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Multimedial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Multimedial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Multimedial] SET RECOVERY FULL 
GO
ALTER DATABASE [Multimedial] SET  MULTI_USER 
GO
ALTER DATABASE [Multimedial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Multimedial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Multimedial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Multimedial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Multimedial] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Multimedial', N'ON'
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\ReportServer]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT SERVICE\ReportServer] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DESKTOP-MJK5D9B\fm010]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [DESKTOP-MJK5D9B\fm010] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [consulta]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [consulta] WITH PASSWORD=N'±w|cfíôåëÌ2jè\!­ ¤ÑÙe¡', DEFAULT_DATABASE=[Multimedial], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [consulta] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [admin]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [admin] WITH PASSWORD=N'AÃ`°CAZaéN(³¹y»á$	f#	ä,Òe', DEFAULT_DATABASE=[Multimedial], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [admin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'<Añm-ß[À¨ÛôüÚ1/%×Éìo¿?EHþ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 11/10/2015 16:24:13 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N' ¢''¿W[«ô.V£Ãµ[N!ÛÀèfMæ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-MJK5D9B\fm010]
GO
USE [Multimedial]
GO
/****** Object:  User [consultaUser]    Script Date: 11/10/2015 16:24:13 ******/
CREATE USER [consultaUser] FOR LOGIN [consulta] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [adminUser]    Script Date: 11/10/2015 16:24:13 ******/
CREATE USER [adminUser] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [consultaRol]    Script Date: 11/10/2015 16:24:13 ******/
CREATE ROLE [consultaRol]
GO
/****** Object:  DatabaseRole [adminRol]    Script Date: 11/10/2015 16:24:13 ******/
CREATE ROLE [adminRol]
GO
ALTER ROLE [consultaRol] ADD MEMBER [consultaUser]
GO
ALTER ROLE [adminRol] ADD MEMBER [adminUser]
GO
DENY DELETE TO [adminRol] AS [dbo]
GO
DENY INSERT TO [adminRol] AS [dbo]
GO
DENY SELECT TO [adminRol] AS [dbo]
GO
DENY UPDATE TO [adminRol] AS [dbo]
GO
GRANT AUTHENTICATE TO [adminRol] AS [dbo]
GO
GRANT CONNECT TO [adminRol] AS [dbo]
GO
GRANT EXECUTE TO [adminRol] AS [dbo]
GO
GRANT CONNECT TO [adminUser] AS [dbo]
GO
DENY DELETE TO [consultaRol] AS [dbo]
GO
DENY INSERT TO [consultaRol] AS [dbo]
GO
DENY SELECT TO [consultaRol] AS [dbo]
GO
DENY UPDATE TO [consultaRol] AS [dbo]
GO
GRANT AUTHENTICATE TO [consultaRol] AS [dbo]
GO
GRANT CONNECT TO [consultaRol] AS [dbo]
GO
GRANT EXECUTE TO [consultaRol] AS [dbo]
GO
GRANT CONNECT TO [consultaUser] AS [dbo]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 11/10/2015 16:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventario](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NULL,
	[Costo] [money] NULL,
	[PrecioFinal] [money] NULL,
	[DescuentoMaximo] [smallint] NULL,
	[Foto] [varbinary](max) NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 11/10/2015 16:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marcas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Marcas] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 11/10/2015 16:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[IdMarca] [int] NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 11/10/2015 16:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecetaXProducto]    Script Date: 11/10/2015 16:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaXProducto](
	[IdReceta] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [PK_RecetaXProducto] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
ALTER TABLE [dbo].[RecetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_RecetaXProducto_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[RecetaXProducto] CHECK CONSTRAINT [FK_RecetaXProducto_Productos]
GO
ALTER TABLE [dbo].[RecetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_RecetaXProducto_Recetas] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Recetas] ([Id])
GO
ALTER TABLE [dbo].[RecetaXProducto] CHECK CONSTRAINT [FK_RecetaXProducto_Recetas]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarProductos]    Script Date: 11/10/2015 16:24:14 ******/
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
GRANT EXECUTE ON [dbo].[sp_consultarProductos] TO [adminRol] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[sp_consultarProductos] TO [consultaRol] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarRecetas]    Script Date: 11/10/2015 16:24:14 ******/
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
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  r.Id as IdReceta, r.Nombre as NombreReceta, r.Descripcion, p.Id as IdProducto, p.Nombre as NombreProducto
	FROM Recetas r, RecetaXProducto rp, Productos p
	WHERE p.Id=rp.IdProducto and r.Id = rp.IdReceta
END

GO
GRANT EXECUTE ON [dbo].[sp_consultarRecetas] TO [adminRol] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[sp_consultarRecetas] TO [consultaRol] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarProducto]    Script Date: 11/10/2015 16:24:14 ******/
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
	@pFoto varbinary(MAX)=NULL
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT Id FROM Marcas where Nombre=@pMarca)
		INSERT INTO Marcas VALUES (@pMarca)
	ELSE
		BEGIN
			INSERT INTO Productos 
			VALUES(	@pNombre, 
					(SELECT Id FROM Marcas WHERE Nombre = @pMarca),
					@pDescripcion)
			INSERT INTO Inventario
			VALUES(@pCantidad, @pCosto, @pPrecioFinal, @pDescuentoMaximo,@pFoto)
		END
END

GO
GRANT EXECUTE ON [dbo].[sp_insertarProducto] TO [adminRol] AS [dbo]
GO
DENY EXECUTE ON [dbo].[sp_insertarProducto] TO [consultaRol] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertarReceta]    Script Date: 11/10/2015 16:24:14 ******/
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
	@pIdProducto1 int, @pIdProducto2 int=NULL, @pIdProducto3 int=NULL,
	@pIdProducto4 int=NULL, @pIdProducto5 int=NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Recetas
	VALUES(@pNombre, @pDescripcion)

	DECLARE @IdReceta int = @@IDENTITY 

	INSERT INTO RecetaXProducto 
	VALUES(@IdReceta, @pIdProducto1)

	IF @pIdProducto2 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@IdReceta, @pIdProducto2)
		END
	IF @pIdProducto3 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@IdReceta, @pIdProducto3)
		END
	IF @pIdProducto4 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@IdReceta, @pIdProducto4)
		END
	IF @pIdProducto5 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@IdReceta, @pIdProducto5)
		END
END

GO
GRANT EXECUTE ON [dbo].[sp_insertarReceta] TO [adminRol] AS [dbo]
GO
DENY EXECUTE ON [dbo].[sp_insertarReceta] TO [consultaRol] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarProducto]    Script Date: 11/10/2015 16:24:14 ******/
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
	@pFoto varbinary(MAX)=NULL
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT Id FROM Marcas where Nombre=@pMarca)
		INSERT INTO Marcas VALUES (@pMarca)
	ELSE
		BEGIN
			UPDATE Productos 
			SET Nombre=@pNombre, 
				IdMarca = (SELECT Id FROM Marcas WHERE Nombre = @pMarca),
				Descripcion = @pDescripcion
			WHERE Id = @pIdProducto
			
			UPDATE Inventario
			SET Cantidad=@pCantidad, 
				Costo = @pCosto, 
				PrecioFinal = @pPrecioFinal, 
				DescuentoMaximo=@pDescuentoMaximo,
				Foto = @pFoto
			WHERE IdProducto=@pIdProducto
		END
END

GO
GRANT EXECUTE ON [dbo].[sp_modificarProducto] TO [adminRol] AS [dbo]
GO
DENY EXECUTE ON [dbo].[sp_modificarProducto] TO [consultaRol] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarReceta]    Script Date: 11/10/2015 16:24:14 ******/
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
	@pIdReceta int, @pNombre varchar(50), @pDescripcion varchar(MAX),
	@pIdProducto1 int, @pIdProducto2 int=NULL, @pIdProducto3 int=NULL,
	@pIdProducto4 int=NULL, @pIdProducto5 int=NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Recetas
	SET Nombre = @pNombre, 
		Descripcion = @pDescripcion 
	WHERE Id = @pIdReceta

	DELETE FROM RecetaXProducto
	WHERE IdReceta = @pIdReceta

	INSERT INTO RecetaXProducto 
	VALUES(@pIdReceta, @pIdProducto1)

	IF @pIdProducto2 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@pIdReceta, @pIdProducto2)
		END
	IF @pIdProducto3 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@pIdReceta, @pIdProducto3)
		END
	IF @pIdProducto4 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@pIdReceta, @pIdProducto4)
		END
	IF @pIdProducto5 IS NOT NULL
		BEGIN
			INSERT INTO RecetaXProducto 
			VALUES(@pIdReceta, @pIdProducto5)
		END
END

GO
GRANT EXECUTE ON [dbo].[sp_modificarReceta] TO [adminRol] AS [dbo]
GO
DENY EXECUTE ON [dbo].[sp_modificarReceta] TO [consultaRol] AS [dbo]
GO
USE [master]
GO
ALTER DATABASE [Multimedial] SET  READ_WRITE 
GO
