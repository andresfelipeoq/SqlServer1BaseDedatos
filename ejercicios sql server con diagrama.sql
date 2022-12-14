USE [master]
GO
/****** Object:  Database [bdventas]    Script Date: 26/07/2022 7:35:37 p. m. ******/
CREATE DATABASE [bdventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bdventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bdventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bdventas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdventas] SET RECOVERY FULL 
GO
ALTER DATABASE [bdventas] SET  MULTI_USER 
GO
ALTER DATABASE [bdventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdventas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdventas', N'ON'
GO
ALTER DATABASE [bdventas] SET QUERY_STORE = OFF
GO
USE [bdventas]
GO
/****** Object:  Table [dbo].[boleta]    Script Date: 26/07/2022 7:35:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boleta](
	[numbol] [int] NOT NULL,
	[fecha] [smalldatetime] NULL,
	[total] [numeric](18, 0) NULL,
	[codcliente] [char](4) NULL,
	[codempleado] [char](4) NULL,
 CONSTRAINT [PK_boleta] PRIMARY KEY CLUSTERED 
(
	[numbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 26/07/2022 7:35:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[codcategoria] [char](4) NOT NULL,
	[descategoria] [char](50) NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[codcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/07/2022 7:35:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[codcliente] [char](4) NOT NULL,
	[nomclientte] [char](40) NULL,
	[apelcliente] [char](40) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[codcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 26/07/2022 7:35:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[numbol] [int] NULL,
	[codproducto] [char](4) NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 26/07/2022 7:35:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[codempleado] [char](4) NOT NULL,
	[nomempleado] [char](50) NULL,
	[apelempleado] [char](50) NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[codempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 26/07/2022 7:35:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[codproducto] [char](4) NOT NULL,
	[nomproducto] [char](50) NULL,
	[puproducto] [numeric](18, 0) NULL,
	[codcategoria] [char](4) NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[codproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[boleta]  WITH CHECK ADD  CONSTRAINT [FK_boleta_cliente] FOREIGN KEY([codcliente])
REFERENCES [dbo].[cliente] ([codcliente])
GO
ALTER TABLE [dbo].[boleta] CHECK CONSTRAINT [FK_boleta_cliente]
GO
ALTER TABLE [dbo].[boleta]  WITH CHECK ADD  CONSTRAINT [FK_boleta_empleado] FOREIGN KEY([codempleado])
REFERENCES [dbo].[empleado] ([codempleado])
GO
ALTER TABLE [dbo].[boleta] CHECK CONSTRAINT [FK_boleta_empleado]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_boleta] FOREIGN KEY([numbol])
REFERENCES [dbo].[boleta] ([numbol])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_boleta]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_producto] FOREIGN KEY([codproducto])
REFERENCES [dbo].[producto] ([codproducto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_producto]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_categoria] FOREIGN KEY([codcategoria])
REFERENCES [dbo].[categoria] ([codcategoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_categoria]
GO
USE [master]
GO
ALTER DATABASE [bdventas] SET  READ_WRITE 
GO
