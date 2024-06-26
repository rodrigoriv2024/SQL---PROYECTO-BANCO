USE [master]
GO
/****** Object:  Database [sisbanco]    Script Date: 24/6/2024 02:51:46 ******/
CREATE DATABASE [sisbanco]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sisbanco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\sisbanco.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sisbanco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\sisbanco_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sisbanco] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sisbanco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sisbanco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sisbanco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sisbanco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sisbanco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sisbanco] SET ARITHABORT OFF 
GO
ALTER DATABASE [sisbanco] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sisbanco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sisbanco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sisbanco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sisbanco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sisbanco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sisbanco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sisbanco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sisbanco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sisbanco] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sisbanco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sisbanco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sisbanco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sisbanco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sisbanco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sisbanco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sisbanco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sisbanco] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sisbanco] SET  MULTI_USER 
GO
ALTER DATABASE [sisbanco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sisbanco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sisbanco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sisbanco] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sisbanco] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sisbanco] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sisbanco] SET QUERY_STORE = ON
GO
ALTER DATABASE [sisbanco] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sisbanco]
GO
/****** Object:  Table [dbo].[banco]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banco](
	[banc_cuit] [varchar](11) NOT NULL,
	[banc_nom] [varchar](30) NOT NULL,
	[banc_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[banc_cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cli_dni] [varchar](8) NOT NULL,
	[cli_nomb] [nchar](50) NOT NULL,
	[cli_apellido] [nchar](50) NOT NULL,
	[cli_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cli_dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente_sucursal]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente_sucursal](
	[clisuc_id] [int] NOT NULL,
	[clisuc_dni] [varchar](8) NOT NULL,
	[clisuc_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[clisuc_id] ASC,
	[clisuc_dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[cue_num] [int] NOT NULL,
	[cue_cli_dni] [varchar](8) NULL,
	[cue_suc_id] [int] NULL,
	[cue_mon_cod] [int] NOT NULL,
	[cue_sal] [real] NULL,
	[cue_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cue_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moneda]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moneda](
	[mon_cod] [int] IDENTITY(1,1) NOT NULL,
	[mon_desc] [varchar](30) NOT NULL,
	[mon_cotiza] [real] NOT NULL,
	[mon_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mon_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[suc_id] [int] IDENTITY(1,1) NOT NULL,
	[suc_dir] [varchar](50) NOT NULL,
	[suc_dir_nro] [int] NOT NULL,
	[suc_cuit] [varchar](11) NOT NULL,
	[suc_estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[suc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transaccion]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transaccion](
	[tipotra_cod] [int] IDENTITY(1,1) NOT NULL,
	[tipotra_desc] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipotra_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 24/6/2024 02:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaccion](
	[tra_cod] [int] IDENTITY(1,1) NOT NULL,
	[tra_cue_origen] [int] NOT NULL,
	[tra_cue_destino] [int] NOT NULL,
	[tra_tipotra_cod] [int] NOT NULL,
	[tra_monto] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tra_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[banco] ([banc_cuit], [banc_nom], [banc_estado]) VALUES (N'30234569879', N'Banco CABA', N'A')
GO
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'11234987', N'Volpe                                             ', N'Aldana                                            ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'14865987', N'Alvarez                                           ', N'Adriana                                           ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'14878457', N'Hartigh                                           ', N'Lucia                                             ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'15436727', N'Cidale                                            ', N'Pablo                                             ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'16365987', N'Pacciolli                                         ', N'Luca                                              ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'19034287', N'Altuna                                            ', N'Maria                                             ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'20355987', N'Aristo                                            ', N'Flavia                                            ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'21345987', N'Casco                                             ', N'Adriana                                           ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'23154789', N'Greco                                             ', N'Jorge                                             ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'24869874', N'Papas                                             ', N'Sandra                                            ', N'A')
INSERT [dbo].[cliente] ([cli_dni], [cli_nomb], [cli_apellido], [cli_estado]) VALUES (N'26547876', N'Ferrer                                            ', N'Pablo                                             ', N'A')
GO
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (1, N'11234987', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (1, N'14865987', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (1, N'15436727', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (1, N'26547876', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (2, N'19034287', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (2, N'21345987', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (3, N'14878457', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (3, N'16365987', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (3, N'20355987', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (3, N'23154789', N'A')
INSERT [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni], [clisuc_estado]) VALUES (3, N'24869874', N'A')
GO
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (21021, N'11234987', 1, 1, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (21238, N'15436727', 1, 1, 507800, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (21450, N'14865987', 1, 1, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (21599, N'21345987', 2, 1, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (22239, N'19034287', 2, 2, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23001, N'23154789', 3, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23010, N'24869874', 3, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23021, N'11234987', 1, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23105, N'14878457', 3, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23238, N'15436727', 1, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23239, N'19034287', 2, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23303, N'16365987', 3, 3, 100, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23450, N'14865987', 1, 3, 45000, N'A')
INSERT [dbo].[cuenta] ([cue_num], [cue_cli_dni], [cue_suc_id], [cue_mon_cod], [cue_sal], [cue_estado]) VALUES (23599, N'21345987', 2, 3, 100, N'A')
GO
SET IDENTITY_INSERT [dbo].[moneda] ON 

INSERT [dbo].[moneda] ([mon_cod], [mon_desc], [mon_cotiza], [mon_estado]) VALUES (1, N'Dolar', 4.2, N'A')
INSERT [dbo].[moneda] ([mon_cod], [mon_desc], [mon_cotiza], [mon_estado]) VALUES (2, N'Euro', 5.6, N'A')
INSERT [dbo].[moneda] ([mon_cod], [mon_desc], [mon_cotiza], [mon_estado]) VALUES (3, N'Peso', 1, N'A')
SET IDENTITY_INSERT [dbo].[moneda] OFF
GO
SET IDENTITY_INSERT [dbo].[sucursal] ON 

INSERT [dbo].[sucursal] ([suc_id], [suc_dir], [suc_dir_nro], [suc_cuit], [suc_estado]) VALUES (1, N'Independencia', 956, N'30234569879', N'A')
INSERT [dbo].[sucursal] ([suc_id], [suc_dir], [suc_dir_nro], [suc_cuit], [suc_estado]) VALUES (2, N'La Rioja', 1254, N'30234569879', N'A')
INSERT [dbo].[sucursal] ([suc_id], [suc_dir], [suc_dir_nro], [suc_cuit], [suc_estado]) VALUES (3, N'Av. Paseo Colon', 903, N'30234569879', N'A')
INSERT [dbo].[sucursal] ([suc_id], [suc_dir], [suc_dir_nro], [suc_cuit], [suc_estado]) VALUES (4, N'Helguera', 1956, N'30234569879', N'A')
SET IDENTITY_INSERT [dbo].[sucursal] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_transaccion] ON 

INSERT [dbo].[tipo_transaccion] ([tipotra_cod], [tipotra_desc]) VALUES (1, N'Deposito')
INSERT [dbo].[tipo_transaccion] ([tipotra_cod], [tipotra_desc]) VALUES (2, N'Extraccion')
INSERT [dbo].[tipo_transaccion] ([tipotra_cod], [tipotra_desc]) VALUES (3, N'Transferencia')
SET IDENTITY_INSERT [dbo].[tipo_transaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[transaccion] ON 

INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (1, 23450, 0, 1, 1500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (2, 23450, 0, 1, 12500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (3, 23450, 0, 1, 50.23)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (4, 23450, 0, 2, 2500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (5, 23450, 0, 2, 1500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (6, 23450, 0, 2, 3500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (7, 23450, 0, 2, 1500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (8, 23450, 0, 1, 600)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (9, 23450, 23021, 3, 1000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (10, 23450, 23021, 3, 3620)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (11, 23450, 23010, 3, 350)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (12, 23021, 0, 1, 9500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (13, 23021, 0, 1, 230)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (14, 23021, 0, 1, 2500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (15, 23021, 0, 2, 700)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (16, 23021, 0, 2, 350)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (17, 23021, 0, 2, 1900)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (18, 23021, 0, 1, 600)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (19, 23021, 23450, 3, 1350)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (20, 23238, 0, 2, 1900)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (21, 23238, 0, 1, 600)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (22, 23238, 23450, 3, 390)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (23, 23599, 23239, 3, 11350)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (24, 23599, 0, 2, 3960)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (25, 23599, 0, 1, 60000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (26, 23599, 23001, 3, 15000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (27, 23599, 0, 1, 60000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (28, 22239, 0, 1, 28500)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (29, 21599, 0, 1, 12000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (30, 21599, 21238, 3, 2550)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (31, 21599, 0, 2, 3000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (32, 23001, 0, 1, 150)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (33, 23010, 0, 1, 150)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (34, 23105, 0, 1, 150)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (35, 23303, 0, 1, 150)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (36, 23450, 0, 1, 10000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (37, 23450, 0, 2, 10000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (38, 23450, 0, 2, 10000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (39, 23450, 0, 2, 99)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (40, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (41, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (42, 21238, 0, 2, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (43, 21238, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (44, 21238, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (45, 21238, 0, 1, 500000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (46, 21238, 0, 1, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (47, 21238, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (48, 21238, 23450, 3, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (49, 21238, 23450, 3, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (50, 21238, 23450, 3, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (51, 23450, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (52, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (53, 23450, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (54, 23450, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (55, 23450, 0, 2, 100)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (56, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (57, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (58, 23450, 21238, 3, 2000)
INSERT [dbo].[transaccion] ([tra_cod], [tra_cue_origen], [tra_cue_destino], [tra_tipotra_cod], [tra_monto]) VALUES (59, 23450, 0, 2, 1000)
SET IDENTITY_INSERT [dbo].[transaccion] OFF
GO
ALTER TABLE [dbo].[banco] ADD  DEFAULT ('A') FOR [banc_estado]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('A') FOR [cli_estado]
GO
ALTER TABLE [dbo].[cliente_sucursal] ADD  DEFAULT ('A') FOR [clisuc_estado]
GO
ALTER TABLE [dbo].[cuenta] ADD  DEFAULT ((0)) FOR [cue_sal]
GO
ALTER TABLE [dbo].[cuenta] ADD  DEFAULT ('A') FOR [cue_estado]
GO
ALTER TABLE [dbo].[moneda] ADD  DEFAULT ('A') FOR [mon_estado]
GO
ALTER TABLE [dbo].[sucursal] ADD  DEFAULT ('A') FOR [suc_estado]
GO
ALTER TABLE [dbo].[cliente_sucursal]  WITH CHECK ADD FOREIGN KEY([clisuc_id])
REFERENCES [dbo].[sucursal] ([suc_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cliente_sucursal]  WITH CHECK ADD FOREIGN KEY([clisuc_dni])
REFERENCES [dbo].[cliente] ([cli_dni])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD FOREIGN KEY([cue_suc_id], [cue_cli_dni])
REFERENCES [dbo].[cliente_sucursal] ([clisuc_id], [clisuc_dni])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD FOREIGN KEY([cue_mon_cod])
REFERENCES [dbo].[moneda] ([mon_cod])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([suc_cuit])
REFERENCES [dbo].[banco] ([banc_cuit])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[banco]  WITH CHECK ADD CHECK  (([banc_estado]='B' OR [banc_estado]='A'))
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD CHECK  (([cli_estado]='B' OR [cli_estado]='A'))
GO
ALTER TABLE [dbo].[cliente_sucursal]  WITH CHECK ADD CHECK  (([clisuc_estado]='B' OR [clisuc_estado]='A'))
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD CHECK  (([cue_estado]='B' OR [cue_estado]='A'))
GO
ALTER TABLE [dbo].[moneda]  WITH CHECK ADD CHECK  (([mon_estado]='B' OR [mon_estado]='A'))
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD CHECK  (([suc_estado]='B' OR [suc_estado]='A'))
GO
USE [master]
GO
ALTER DATABASE [sisbanco] SET  READ_WRITE 
GO
