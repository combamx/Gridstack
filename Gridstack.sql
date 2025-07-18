USE [Gridstack]
GO
ALTER TABLE [dbo].[DetalleVenta] DROP CONSTRAINT [FK__DetalleVe__Venta__3F466844]
GO
ALTER TABLE [dbo].[DetalleVenta] DROP CONSTRAINT [FK__DetalleVe__Produ__403A8C7D]
GO
ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [DF__Ventas__Fecha__3C69FB99]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 25/04/2025 01:17:12 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ventas]') AND type in (N'U'))
DROP TABLE [dbo].[Ventas]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/04/2025 01:17:12 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Productos]') AND type in (N'U'))
DROP TABLE [dbo].[Productos]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 25/04/2025 01:17:12 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleVenta]') AND type in (N'U'))
DROP TABLE [dbo].[DetalleVenta]
GO
USE [master]
GO
/****** Object:  Database [Gridstack]    Script Date: 25/04/2025 01:17:12 p. m. ******/
DROP DATABASE [Gridstack]
GO
/****** Object:  Database [Gridstack]    Script Date: 25/04/2025 01:17:12 p. m. ******/
CREATE DATABASE [Gridstack]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gridstack', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Gridstack.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gridstack_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Gridstack_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Gridstack] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gridstack].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gridstack] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gridstack] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gridstack] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gridstack] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gridstack] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gridstack] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gridstack] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gridstack] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gridstack] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gridstack] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gridstack] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gridstack] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gridstack] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gridstack] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gridstack] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gridstack] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gridstack] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gridstack] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gridstack] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gridstack] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gridstack] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gridstack] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gridstack] SET RECOVERY FULL 
GO
ALTER DATABASE [Gridstack] SET  MULTI_USER 
GO
ALTER DATABASE [Gridstack] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gridstack] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gridstack] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gridstack] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gridstack] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gridstack] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gridstack', N'ON'
GO
ALTER DATABASE [Gridstack] SET QUERY_STORE = ON
GO
ALTER DATABASE [Gridstack] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Gridstack]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 25/04/2025 01:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VentaId] [int] NULL,
	[ProductoId] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
	[Subtotal]  AS ([Cantidad]*[PrecioUnitario]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/04/2025 01:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Categoria] [nvarchar](50) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[ImagenUrl] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 25/04/2025 01:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([Id], [VentaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (4, 1, 1, 1, CAST(15999.99 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([Id], [VentaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (5, 1, 2, 1, CAST(18999.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (1, N'Laptop Dell Inspiron 15', N'Laptops', CAST(15999.99 AS Decimal(10, 2)), 10, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqDvMYVEBRJcejRgb6TkvK6Rk9y7foV4WbRA&s')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (2, N'Smartphone Samsung Galaxy S23', N'Smartphones', CAST(18999.00 AS Decimal(10, 2)), 15, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdLrTOHxn66PSRUfiI1ERNBL1EoSLICzwnww&s')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (3, N'Monitor LG UltraWide 29"', N'Monitores', CAST(6499.50 AS Decimal(10, 2)), 8, N'https://m.media-amazon.com/images/I/71JSooDblJS.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (4, N'Teclado Mecánico Logitech G413', N'Periféricos', CAST(1999.99 AS Decimal(10, 2)), 25, N'https://m.media-amazon.com/images/I/61ASjTxZ-NL._AC_UF894,1000_QL80_.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (5, N'Mouse Inalámbrico Logitech MX Master 3', N'Periféricos', CAST(2499.99 AS Decimal(10, 2)), 20, N'https://m.media-amazon.com/images/I/51xU1hlYASL._AC_UF894,1000_QL80_.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (6, N'Tablet Apple iPad 10.2"', N'Tablets', CAST(10999.00 AS Decimal(10, 2)), 12, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrThxmRBZ_GssMkUH1RtBtmH4Ay0SsT0CCGQ&s')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (7, N'Audífonos Sony WH-1000XM4', N'Audio', CAST(8499.00 AS Decimal(10, 2)), 10, N'https://mxsonyb2c.vtexassets.com/arquivos/ids/316335/01_Product_WH-1000XM4-L.jpg?v=638632951385900000')
INSERT [dbo].[Productos] ([Id], [Nombre], [Categoria], [Precio], [Stock], [ImagenUrl]) VALUES (8, N'Disco Duro Externo Seagate 2TB', N'Almacenamiento', CAST(1599.00 AS Decimal(10, 2)), 30, N'https://pcmig.com.mx/wp-content/uploads/2020/02/Seagate-Expansion-2TB-1.jpg')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([Id], [Fecha], [Total]) VALUES (1, CAST(N'2025-04-23T09:27:35.890' AS DateTime), CAST(34998.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([VentaId])
REFERENCES [dbo].[Ventas] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Gridstack] SET  READ_WRITE 
GO
