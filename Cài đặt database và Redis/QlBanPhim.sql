USE [master]
GO
/****** Object:  Database [QlBanPhim]    Script Date: 5/21/2022 3:58:17 PM ******/
CREATE DATABASE [QlBanPhim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlBanPhim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlBanPhim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QlBanPhim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlBanPhim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QlBanPhim] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlBanPhim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QlBanPhim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlBanPhim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlBanPhim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlBanPhim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlBanPhim] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlBanPhim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QlBanPhim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QlBanPhim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlBanPhim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlBanPhim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlBanPhim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlBanPhim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlBanPhim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlBanPhim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlBanPhim] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QlBanPhim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlBanPhim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlBanPhim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlBanPhim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlBanPhim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlBanPhim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlBanPhim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlBanPhim] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QlBanPhim] SET  MULTI_USER 
GO
ALTER DATABASE [QlBanPhim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QlBanPhim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlBanPhim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlBanPhim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QlBanPhim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QlBanPhim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QlBanPhim] SET QUERY_STORE = OFF
GO
USE [QlBanPhim]
GO
/****** Object:  FullTextCatalog [FullText_Product]    Script Date: 5/21/2022 3:58:18 PM ******/
CREATE FULLTEXT CATALOG [FullText_Product] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaHD] [bigint] NULL,
	[MaSP] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [bigint] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaDanhGia] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSP] [nvarchar](50) NULL,
	[MaKhachHang] [bigint] NULL,
	[NoiDung] [nvarchar](50) NULL,
	[NgayThem] [date] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[MaDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKH] [bigint] NULL,
	[NgayMua] [date] NULL,
	[NgayGiaoHang] [date] NULL,
	[TrangThai] [int] NULL,
	[ThanhTien] [bigint] NULL,
	[PTTT] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hoa] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[SoDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Pass] [nvarchar](500) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](50) NOT NULL,
	[AnhSP] [nvarchar](150) NULL,
	[TenSP] [nvarchar](150) NULL,
	[DonGia] [bigint] NULL,
	[GiamGia] [int] NULL,
	[MaLoai] [nvarchar](50) NULL,
	[MaSwitch] [nvarchar](50) NULL,
	[NgayThem] [date] NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](4000) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Switch]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Switch](
	[MaSwitch] [nvarchar](50) NOT NULL,
	[TenSwitch] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaSwitch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserName], [Password]) VALUES (N'admin@gmail.com', N'$2a$10$QnC1MGW2oNyfZ1DOMw2Slu/BWWmCMuvUMOq3AcMaNO5kZJ5Iobm82')
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (1, 1, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (2, 2, N'ablu2', 4, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (3, 2, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (4, 3, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (5, 3, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (6, 4, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (7, 4, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (8, 5, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (9, 5, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (10, 6, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (11, 6, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (12, 7, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (13, 8, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (14, 9, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (15, 9, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (16, 10, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (17, 11, N'albu4', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (18, 12, N'adbz1', 5, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (19, 12, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (20, 13, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (21, 14, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (22, 15, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (23, 15, N'adbz1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (24, 16, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (25, 17, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (26, 18, N'ablu1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (27, 18, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (28, 19, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (29, 20, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (30, 21, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (31, 21, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (32, 22, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (33, 23, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (34, 23, N'ablu1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (35, 24, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (36, 24, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (37, 25, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (38, 25, N'amrb2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (39, 26, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (40, 27, N'ablu1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (41, 27, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (42, 28, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (43, 29, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (44, 30, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (45, 30, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (46, 31, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (47, 32, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (48, 33, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (49, 34, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (50, 34, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (51, 34, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (52, 34, N'amrb2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (53, 35, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (54, 35, N'albu4', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (55, 35, N'ablu2', 2, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (56, 36, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (57, 36, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (58, 36, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (59, 37, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (60, 38, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (61, 39, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (62, 40, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (63, 40, N'ablu1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (64, 41, N'adbz3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (65, 42, N'adbz3', 4, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (66, 43, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (67, 43, N'ablu1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (68, 44, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (69, 45, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (70, 46, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (71, 47, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (72, 48, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (73, 49, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (74, 50, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (75, 51, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (76, 52, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (77, 52, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (78, 53, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (79, 54, N'awtt1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (80, 54, N'adbz1', 3, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (81, 55, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 56, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (83, 57, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (84, 58, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (85, 59, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (86, 60, N'amrb1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (87, 61, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (88, 62, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (89, 62, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (90, 63, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (91, 63, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (92, 63, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (93, 63, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (94, 64, N'amrb2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (95, 65, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (96, 66, N'amrb2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (97, 67, N'amrb2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (98, 68, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (99, 69, N'adbz1', 1, 346135250)
GO
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (100, 69, N'ablu2', 4, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (101, 69, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (102, 69, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (103, 70, N'awtt1', 6, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (104, 70, N'adbz3', 2, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (105, 70, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 71, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (107, 71, N'ablu1', 2, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (108, 71, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (109, 72, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (110, 73, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (111, 73, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (112, 74, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (113, 74, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (114, 74, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (115, 74, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (116, 74, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (117, 75, N'ablu1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (118, 76, N'awtt1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (119, 76, N'adbz1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (120, 76, N'adbz2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (121, 77, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (122, 78, N'adbz1', 4, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (123, 78, N'ablu2', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (124, 79, N'ablu3', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (125, 80, N'gpro', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (126, 80, N'rhtv1', 1, 346135250)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (127, 81, N'amrb2', 1, 1439100)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (128, 81, N'ck55', 1, 2808000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (129, 82, N'gpro', 1, 1942500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (130, 86, N'ck57', 1, 2610000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (131, 87, N'ck57', 1, 2610000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (132, 88, N'rhtv1', 1, 2626500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (133, 89, N'e512', 1, 1642500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (134, 89, N'i55', 1, 2808000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (135, 89, N'aswtt1', 2, 4198500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (136, 90, N'adbz1', 1, 1839200)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (137, 91, N'asdbz1', 1, 1839200)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (138, 91, N'ck70', 3, 8389500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (139, 92, N'ekda', 1, 3105550)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (140, 92, N'g213', 1, 891000)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (141, 92, N'asmrb2', 1, 1439100)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (142, 93, N'i512', 1, 1642500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (143, 94, N'd70', 1, 2796500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (144, 95, N'd70', 1, 2796500)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (145, 96, N'i95', 1, 3646500)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([MaDanhGia], [MaSP], [MaKhachHang], [NoiDung], [NgayThem]) VALUES (1, N'ekda', 1, N'Sản phẩm dùng tốt', CAST(N'2022-05-19' AS Date))
INSERT [dbo].[DanhGia] ([MaDanhGia], [MaSP], [MaKhachHang], [NoiDung], [NgayThem]) VALUES (3, N'i95', 1, N'sản phẩm dùng tốt', CAST(N'2022-05-20' AS Date))
INSERT [dbo].[DanhGia] ([MaDanhGia], [MaSP], [MaKhachHang], [NoiDung], [NgayThem]) VALUES (4, N'i68', 1, N'sản phẩm dùng tốt', CAST(N'2022-05-20' AS Date))
INSERT [dbo].[DanhGia] ([MaDanhGia], [MaSP], [MaKhachHang], [NoiDung], [NgayThem]) VALUES (5, N'asdbz1', 1, N'Sản phẩm dùng rất tốt', CAST(N'2022-05-20' AS Date))
INSERT [dbo].[DanhGia] ([MaDanhGia], [MaSP], [MaKhachHang], [NoiDung], [NgayThem]) VALUES (7, N'd70', 1, N'Dùng rất tốt', CAST(N'2022-05-21' AS Date))
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (1, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (2, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (3, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (4, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (5, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (6, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (7, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (8, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (9, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (10, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (11, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (12, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (13, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (14, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (15, 1, CAST(N'2021-12-14' AS Date), CAST(N'2021-12-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (16, 2, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-15' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (17, 1, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-15' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (18, 1, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-15' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (19, 1, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-15' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (20, 1, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-15' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (21, 1, CAST(N'2021-12-16' AS Date), CAST(N'2021-12-16' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (22, 1, CAST(N'2021-12-16' AS Date), CAST(N'2021-12-16' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (23, 1, CAST(N'2021-12-19' AS Date), CAST(N'2021-12-19' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (24, 1, CAST(N'2021-12-19' AS Date), CAST(N'2021-12-19' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (25, 1, CAST(N'2021-12-20' AS Date), CAST(N'2021-12-20' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (26, 1, CAST(N'2021-12-20' AS Date), CAST(N'2021-12-20' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (27, 1, CAST(N'2021-12-20' AS Date), CAST(N'2021-12-20' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (28, 1, CAST(N'2022-04-08' AS Date), CAST(N'2022-04-08' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (29, 1, CAST(N'2022-04-09' AS Date), CAST(N'2022-04-09' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (30, 1, CAST(N'2022-04-13' AS Date), CAST(N'2022-04-13' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (31, 1, CAST(N'2022-04-19' AS Date), CAST(N'2022-04-19' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (32, 1, CAST(N'2022-04-20' AS Date), CAST(N'2022-04-20' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (33, 2, CAST(N'2022-04-21' AS Date), CAST(N'2022-04-21' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (34, 1, CAST(N'2022-04-21' AS Date), CAST(N'2022-04-21' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (35, 1, CAST(N'2022-04-21' AS Date), CAST(N'2022-04-21' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (36, 1, CAST(N'2022-04-21' AS Date), CAST(N'2022-04-21' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (37, 1, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (38, 1, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (39, 1, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (40, 1, CAST(N'2022-04-30' AS Date), CAST(N'2022-04-30' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (41, 1, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (42, 1, CAST(N'2022-05-03' AS Date), CAST(N'2022-05-03' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (43, 1, CAST(N'2022-05-04' AS Date), CAST(N'2022-05-04' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (44, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (45, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (46, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (47, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (48, 2, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (49, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (50, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (51, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (52, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (53, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (54, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (55, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (56, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (57, 1, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-05' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (58, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (59, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (60, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (61, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (62, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (63, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (64, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (65, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (66, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (67, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (68, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (69, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (70, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (71, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-06' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (72, 1, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-07' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (73, 1, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-07' AS Date), -1, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (74, 1, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-07' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (75, 1, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-07' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (76, 1, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-09' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (77, 1, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-10' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (78, 1, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-11' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (79, 1, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-14' AS Date), 2, 341566250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (80, 1, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-13' AS Date), 2, NULL, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (81, 1, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-13' AS Date), 2, 4247100, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (82, 1, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-13' AS Date), 2, 1942500, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (83, 1, CAST(N'2022-05-14' AS Date), NULL, 0, 2249250, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (84, 5, CAST(N'2022-05-14' AS Date), NULL, NULL, NULL, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (86, 1, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-14' AS Date), 2, 2610000, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (87, 1, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-14' AS Date), 2, 2610000, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (88, 1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-19' AS Date), 2, 2626500, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (89, 1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-15' AS Date), 2, 8649000, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (90, 1, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-17' AS Date), 2, 1839200, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (91, 1, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-19' AS Date), 2, 10228700, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (92, 2, CAST(N'2022-05-20' AS Date), CAST(N'2022-05-20' AS Date), 2, 5435650, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (93, 1, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-21' AS Date), 2, 1642500, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (94, 1, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-21' AS Date), 2, 2796500, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (95, 1, CAST(N'2022-05-21' AS Date), NULL, 0, 2796500, N'Thanh toán khi nhận hàng')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayMua], [NgayGiaoHang], [TrangThai], [ThanhTien], [PTTT]) VALUES (96, 1, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-21' AS Date), 2, 3646500, N'Chuyển khoản qua ATM')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [UserName], [Pass], [TrangThai]) VALUES (1, N'Thân Trọng Tiến', N'Thừa Thiên Huế', N'0385842033', N'thanlong776@gmail.com', N'kh1', N'$2a$10$5Pvg7WTd8uRDOVM7Iu1FoOoGHcQM/RYPPxJ9rSkumH/XIbOX7qqUu', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [UserName], [Pass], [TrangThai]) VALUES (2, N'Tiến Thân', N'Đà Nắng', N'03858420333', N'thantien07122000@gmail.com', N'kh2', N'$2a$10$RymGiuskJVob6Fi6h4UKiulvdvWj2v/JjvMJJrZV1LAPM9In7cpju', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SoDT], [Email], [UserName], [Pass], [TrangThai]) VALUES (5, N'Tiến', N'Huế', N'0385842033', N'tien123@gmail.com', N'KH4', N'$2a$10$RymGiuskJVob6Fi6h4UKiulvdvWj2v/JjvMJJrZV1LAPM9In7cpju', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'akko', N'AKKO')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'asus', N'ASUS')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'corsair', N'CORSAIR')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'ducky', N'DUCKY')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'edra', N'EDRA')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'hyperx', N'HYPERX')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'ikbc', N'IKBC')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'logitech', N'LOGITECH')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'razer', N'RAZER')
GO
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ablu1', N'image_sp/akko_mightnight3.jpg', N'Bàn phím cơ AKKO 3098N Multi-modes Dracula', 2999000, 25, N'akko', N'brown', CAST(N'2022-05-12' AS Date), 100, N'<p>Model: 3098B (98 keys)<br />
Kết nối: USB Type C, c&oacute; thể th&aacute;o rời / Bluetooth 5.0 (tối đa 3 thiết bị)/ Wireless 2.4Ghz (1 trong 3).&nbsp;<strong>NSX khuyến c&aacute;o chỉ n&ecirc;n cắm USB receiver 2.4ghz v&agrave;o cổng USB 2.0 để được t&iacute;n hiệu kh&ocirc;ng d&acirc;y tốt nhất.</strong><br />
Pin 3000 mah<br />
LED nền RGB (Backlit, dạng SMT bottom kh&ocirc;ng cấn switch) với nhiều chế độ<br />
Hỗ trợ thay n&oacute;ng switch (hotswap, 5 pin, TTC hotswap socket)<br />
C&oacute; l&oacute;t ti&ecirc;u &acirc;m (FOAM) EVA dầy 3.5mm (nằm giữa plate v&agrave; PCB)<br />
C&oacute; l&oacute;t Foam Silicone ở đ&aacute;y ph&iacute;m<br />
Stab pre-lubed v&agrave; được tinh chỉnh sẵn<br />
K&iacute;ch thước: 382x134x40 mm | Trọng lượng 1.1kg<br />
Keycap: PBT Double-Shot, ASA profile<br />
Loại switch: AKKO CS Switch (Jelly Blue / Jelly Pink / Silver)<br />
Hỗ trợ NKRO / Multimedia / Macro / Kh&oacute;a ph&iacute;m Windows<br />
Phụ kiện: 1 s&aacute;ch hướng dẫn sử dụng + 1 keypuller + 1 cover che bụi + 1 d&acirc;y c&aacute;p USB + USB Receiver 2.4Ghz + keycap tặng k&egrave;m<br />
Tương th&iacute;ch: Windows / MacOS / Linux (c&oacute; hỗ trợ MAC Function)<br />
B&agrave;n ph&iacute;m AKKO khi kết nối với MacOS: (Ctrl -&gt; Control | Windows -&gt; Command | Alt -&gt; Option, Mojave OS trở l&ecirc;n sẽ điều chỉnh được thứ tự của c&aacute;c ph&iacute;m n&agrave;y)</p>

<p><img alt="Keycap tặng kèm của AKKO 3098B Multi-modes Black &amp; Cyan" src="https://akkogear.com.vn/wp-content/uploads/2022/04/ban-phim-co-akko-3098b-multi-modes-black-cyan-08.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ablu2', N'image_sp/akko_multi1.jpg', N'Bàn phím cơ AKKO 3098N Multi-modes NEON', 2999000, 10, N'akko', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ablu3', N'image_sp/akko_mightnight3.jpg', N'Bàn phím cơ AKKO 3068B Multi-modes Black Pink', 2999000, 25, N'akko', N'red', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'adbz1', N'image_sp/akko_goku.jpg', N'Bàn phím cơ AKKO 3087 Dragon Ball Z – Goku', 2299000, 20, N'akko', N'blue', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'adbz2', N'image_sp/akko_goku1.jpg', N'Bàn phím cơ AKKO 3108 Dragon Ball Z – Frieza', 1799000, 5, N'akko', N'black', CAST(N'2022-05-12' AS Date), 110, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'adbz3', N'image_sp/akko_goku2.jpg', N'Bàn phím cơ AKKO 3108 Dragon Ball Z – Vegeta', 2499000, 10, N'akko', N'brown', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'albu4', N'image_sp/akko_model1.jpg', N'Bàn phím cơ AKKO 3098N Multi-modes Ocea', 2999000, 25, N'akko', N'red', CAST(N'2022-05-12' AS Date), 111, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'amrb1', N'image_sp/akko_matcha.jpg', N'Bàn phím cơ AKKO 3098 DS Matcha Red Bean', 1099000, 5, N'akko', N'black', CAST(N'2022-05-12' AS Date), 120, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'amrb2', N'image_sp/akko_matcha1.jpg', N'Bàn phím cơ AKKO 3108 v2 DS Matcha Red Bean', 1599000, 10, N'akko', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asblu1', N'image_sp/akko_mightnight3.jpg', N'Bàn phím cơ ASUS 3098N Multi-modes Dracula', 2999000, 25, N'asus', N'brown', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asblu2', N'image_sp/akko_multi1.jpg', N'Bàn phím cơ ASUS 3098N Multi-modes NEON', 2999000, 10, N'asus', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asblu3', N'image_sp/akko_mightnight3.jpg', N'Bàn phím cơ ASUS 3068B Multi-modes Black Pink', 2999000, 25, N'akko', N'red', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asdbz1', N'image_sp/akko_goku.jpg', N'Bàn phím cơ ASUS 3087 Dragon Ball Z – Goku', 2299000, 20, N'asus', N'blue', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asdbz2', N'image_sp/akko_goku1.jpg', N'Bàn phím cơ ASUS 3108 Dragon Ball Z – Frieza', 1799000, 5, N'asus', N'black', CAST(N'2022-05-12' AS Date), 110, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asdbz3', N'image_sp/akko_goku2.jpg', N'Bàn phím cơ ASUS 3108 Dragon Ball Z – Vegeta', 2499000, 10, N'asus', N'brown', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'aslbu4', N'image_sp/akko_model1.jpg', N'Bàn phím cơ ASUS 3098N Multi-modes Ocea', 2999000, 25, N'asus', N'red', CAST(N'2022-05-12' AS Date), 111, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asmrb1', N'image_sp/akko_matcha.jpg', N'Bàn phím cơ ASUS 3098 DS Matcha Red Bean', 1099000, 5, N'asus', N'black', CAST(N'2022-05-12' AS Date), 120, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'asmrb2', N'image_sp/akko_matcha1.jpg', N'Bàn phím cơ ASUS 3108 v2 DS Matcha Red Bean', 1599000, 10, N'asus', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'aswtt1', N'image_sp/akko_year.jpg', N'Bàn phím cơ ASUS ACR59 Pink', 2799000, 25, N'asus', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'awtt1', N'image_sp/akko_year.jpg', N'Bàn phím cơ AKKO ACR59 Pink', 2799000, 25, N'akko', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck100', N'image_sp/g913.jpg', N'Bàn phím cơ Corsair K100 RGB', 3290000, 15, N'corsair', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck55', N'image_sp/gpro.jpg', N'Bàn phím cơ Corsair K55 RGB Pro', 3120000, 10, N'corsair', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck57', N'image_sp/g913.jpg', N'Bàn phím giả cơ Corsair K57 RGB Wireless
', 2900000, 10, N'corsair', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck60', N'image_sp/rcynosa.jpg', N'Bàn phím cơ Corsair K60 Pro Red Led', 1990000, 25, N'corsair', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck63', N'image_sp/akko_matcha1.jpg', N'Bàn phím cơ Corsair K63', 1690000, 10, N'corsair', N'black', CAST(N'2022-05-12' AS Date), 200, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck68', N'image_sp/gkda.jpg', N'Bàn phím cơ Corsair K68 - Red Led', 2190000, 20, N'corsair', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck70', N'image_sp/g813.jpg', N'Bàn phím Corsair K70 RGB MK.2', 3290000, 15, N'corsair', N'red', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ck95', N'image_sp/rcynosa.jpg', N'Bàn phím Corsair K95 RGB Platinum XT', 4290000, 15, N'corsair', N'black', CAST(N'2022-05-15' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd100', N'image_sp/g913.jpg', N'Bàn phím cơ DUCKY K100 RGB', 3290000, 15, N'ducky', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd55', N'image_sp/gpro.jpg', N'Bàn phím cơ DUCKY K55 RGB Pro', 3120000, 10, N'ducky', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd60', N'image_sp/rcynosa.jpg', N'Bàn phím cơ DUCKY K60 Pro Red Led', 1990000, 25, N'ducky', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd63', N'image_sp/akko_matcha1.jpg', N'Bàn phím cơ DUCKY K63', 1690000, 10, N'ducky', N'black', CAST(N'2022-05-12' AS Date), 200, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd68', N'image_sp/gkda.jpg', N'Bàn phím cơ DUCKY K68 - Red Led', 2190000, 20, N'ducky', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd70', N'image_sp/g813.jpg', N'Bàn phím DUCKY K70 RGB MK.2', 3290000, 15, N'ducky', N'red', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'd95', N'image_sp/rcynosa.jpg', N'Bàn phím DUCKY K95 RGB Platinum XT', 4290000, 15, N'ducky', N'black', CAST(N'2022-05-15' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'e213', N'image_sp/g213.jpg', N'Bàn phím cơ Edra G213', 990000, 10, N'edra', N'slient', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'e512', N'image_sp/g512.jpg', N'Bàn phím cơ Edra G512 GX RGB', 2190000, 25, N'edra', N'red', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'e613', N'image_sp/g613.jpg', N'Bàn phím cơ Edra G613 Wireless', 1790000, 25, N'edra', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'e813', N'image_sp/g813.jpg', N'Bàn phím cơ Edra G813 RGB', 3190000, 25, N'edra', N'blue', CAST(N'2022-05-12' AS Date), 30, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'e913', N'image_sp/g913.jpg', N'Bàn phím cơ Edra G913 TKL Lightspeed Wireless
', 2390000, 10, N'edra', N'slient', CAST(N'2022-05-12' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'ekda', N'image_sp/gkda.jpg', N'Bàn phím cơ Edra G PRO KDA', 3269000, 5, N'edra', N'red', CAST(N'2022-05-13' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'epro', N'image_sp/gpro.jpg', N'Bàn phím cơ Edra G PRO Mechanical', 2590000, 25, N'edra', N'black', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'g213', N'image_sp/g213.jpg', N'Bàn phím cơ Logitech G213', 990000, 10, N'logitech', N'slient', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'g512', N'image_sp/g512.jpg', N'Bàn phím cơ Logitech G512 GX RGB', 2190000, 25, N'logitech', N'red', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'g613', N'image_sp/g613.jpg', N'Bàn phím cơ Logitech G613 Wireless', 1790000, 25, N'logitech', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'g813', N'image_sp/g813.jpg', N'Bàn phím cơ Logitech G813 RGB', 3190000, 25, N'logitech', N'blue', CAST(N'2022-05-12' AS Date), 30, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'g913', N'image_sp/g913.jpg', N'Bàn phím cơ Logitech G913 TKL Lightspeed Wireless
', 2390000, 10, N'logitech', N'slient', CAST(N'2022-05-12' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'gkda', N'image_sp/gkda.jpg', N'Bàn phím cơ Logitech G PRO KDA', 3269000, 5, N'logitech', N'red', CAST(N'2022-05-13' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'gpro', N'image_sp/gpro.jpg', N'Bàn phím cơ Logitech G PRO Mechanical', 2590000, 25, N'logitech', N'black', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hblw', N'image_sp/g913.jpg', N'Bàn phím cơ HyperX Blackwidow Green Switch', 2890000, 15, N'hyperx', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hblwv3', N'image_sp/g813.jpg', N'Bàn phím cơ HyperX Blackwindow V3', 3190000, 20, N'hyperx', N'blue', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hbwv3', N'image_sp/rbwv3.jpg', N'Bàn phím cơ  HyperX Blackwidow V3 Tenkeyless', 2490000, 15, N'hyperx', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hcynosa', N'image_sp/rcynosa.jpg', N'Bàn phím cơ HyperX Cynosa V2 Chroma', 1590000, 10, N'hyperx', N'red', CAST(N'2022-05-12' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hhtv1', N'image_sp/g813.jpg', N'Bàn phím cơ HyperX Huntsman Tournament Edition', 3090000, 15, N'hyperx', N'black', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hhtv2', N'image_sp/gpro.jpg', N'Bàn phím cơ HyperX Huntsman Mini', 2999000, 20, N'hyperx', N'blue', CAST(N'2022-05-12' AS Date), 1000, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'hornta', N'image_sp/rornta.jpg', N'Bàn phím cơ HyperX Ornata V2', 2450000, 10, N'hyperx', N'red', CAST(N'2022-05-12' AS Date), 25, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i100', N'image_sp/g913.jpg', N'Bàn phím cơ Ikbc K100 RGB', 3290000, 15, N'ikbc', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i213', N'image_sp/g213.jpg', N'Bàn phím cơ Ikbc G213', 990000, 10, N'ikbc', N'slient', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i512', N'image_sp/g512.jpg', N'Bàn phím cơ Ikbc G512 GX RGB', 2190000, 25, N'ikbc', N'red', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i55', N'image_sp/gpro.jpg', N'Bàn phím cơ Ikbc K55 RGB Pro', 3120000, 10, N'ikbc', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i60', N'image_sp/rcynosa.jpg', N'Bàn phím cơ Ikbc K60 Pro Red Led', 1990000, 25, N'ikbc', N'red', CAST(N'2022-05-12' AS Date), 300, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i63', N'image_sp/akko_matcha1.jpg', N'Bàn phím cơ Ikbc K63', 1690000, 10, N'ikbc', N'black', CAST(N'2022-05-12' AS Date), 200, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i68', N'image_sp/gkda.jpg', N'Bàn phím cơ Ikbc K68 - Red Led', 2190000, 20, N'ikbc', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i70', N'image_sp/g813.jpg', N'Bàn phím Ikbc K70 RGB MK.2', 3290000, 15, N'ikbc', N'red', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'i95', N'image_sp/rcynosa.jpg', N'Bàn phím Ikbc K95 RGB Platinum XT', 4290000, 15, N'ikbc', N'black', CAST(N'2022-05-15' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rblw', N'image_sp/g913.jpg', N'Bàn phím cơ Razer Blackwidow Green Switch', 2890000, 15, N'razer', N'slient', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rblwv3', N'image_sp/g813.jpg', N'Bàn phím cơ Razer Blackwindow V3', 3190000, 20, N'razer', N'blue', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rbwv3', N'image_sp/rbwv3.jpg', N'Bàn phím cơ  Razer Blackwidow V3 Tenkeyless', 2490000, 15, N'razer', N'blue', CAST(N'2022-05-12' AS Date), 100, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rcynosa', N'image_sp/rcynosa.jpg', N'Bàn phím cơ Razer Cynosa V2 Chroma', 1590000, 10, N'razer', N'red', CAST(N'2022-05-12' AS Date), 10, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rhtv1', N'image_sp/g813.jpg', N'Bàn phím cơ Razer Huntsman Tournament Edition', 3090000, 15, N'razer', N'black', CAST(N'2022-05-12' AS Date), 50, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rhtv2', N'image_sp/gpro.jpg', N'Bàn phím cơ Razer Huntsman Mini', 2999000, 20, N'razer', N'blue', CAST(N'2022-05-12' AS Date), 1000, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
INSERT [dbo].[SanPham] ([MaSP], [AnhSP], [TenSP], [DonGia], [GiamGia], [MaLoai], [MaSwitch], [NgayThem], [SoLuong], [MoTa]) VALUES (N'rornta', N'image_sp/rornta.jpg', N'Bàn phím cơ Razer Ornata V2', 2450000, 10, N'razer', N'red', CAST(N'2022-05-12' AS Date), 25, N'Model: ACR59 (59 keys, giống layout HHKB)<br> LED nền RGB (6028 SMD LED) với nhiều chế độ<br> Vỏ case: Acrylic – Laser – CNC – Sơn<br> Kết nối: USB Type-C 2 Type-A<br> Hỗ trợ NKRO / Multimedia / Macro / Khóa phím windows<br> Plate ACR, Hotswap 5 pin TTC socket<br> Sử dụng AKKO CS Switch – Jelly Pink<br> Keycap PBT Dye-Subbed, Cherry profile<br> Phụ kiện: 1 sách hướng dẫn sử dụng + 1 dây xoắn USB Type-C to USB (màu hợp với màu vỏ case) + Keycap tặng kèm<br> Tương thích: Windows / MacOS / Linux<br> Bàn phím AKKO khi kết nối với MacOS: (Ctrl -> Control | Windows -> Command | Alt -> Option, Mojave OS trở lên sẽ điều chỉnh được thứ tự của các phím này)')
GO
INSERT [dbo].[Switch] ([MaSwitch], [TenSwitch]) VALUES (N'black', N'Black Switch')
INSERT [dbo].[Switch] ([MaSwitch], [TenSwitch]) VALUES (N'blue', N'Blue Switch')
INSERT [dbo].[Switch] ([MaSwitch], [TenSwitch]) VALUES (N'brown', N'Brown Switch')
INSERT [dbo].[Switch] ([MaSwitch], [TenSwitch]) VALUES (N'red', N'Red Switch')
INSERT [dbo].[Switch] ([MaSwitch], [TenSwitch]) VALUES (N'slient', N'Slient Switch')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_KhachHang]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Switch] FOREIGN KEY([MaSwitch])
REFERENCES [dbo].[Switch] ([MaSwitch])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Switch]
GO
/****** Object:  StoredProcedure [dbo].[proc_SummaryByDate]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[proc_SummaryByDate]
@month INT,
@year INT,
@SumofMonth MONEY OUTPUT
AS
	BEGIN
		DECLARE @orDerDate DATE
		DECLARE @tblSummary TABLE(OrDerDate DATE)
		SET @OrDerDate = DATEFROMPARTS(@year,@month,1)
		WHILE(MONTH(@orDerDate) = @month)
			BEGIN
				INSERT @tblSummary ( OrDerDate )
				VALUES  ( @OrDerDate )
				SET @orDerDate = DATEADD(DAY,1,@orDerDate)
			END

	SELECT t1.OrDerDate as N'Day', CASE
						 WHEN t2.RevenueByDate IS NULL THEN 0
						 ELSE t2.RevenueByDate
						 END AS N'TotalPrice'
	FROM @tblSummary AS t1
	LEFT JOIN(	SELECT HD.NgayMua, SUM(CTHD.SoLuong*CTHD.ThanhTien) AS RevenueByDate
				FROM dbo.ChiTietHoaDon AS CTHD INNER JOIN dbo.HoaDon AS HD ON CTHD.MaHD = HD.MaHD
				WHERE MONTH(HD.NgayMua) = @month AND YEAR(HD.NgayMua) = @year
				GROUP BY HD.NgayMua ) AS t2 ON t2.NgayMua = t1.OrDerDate

	SELECT @SumofMonth = SUM(CTHD.SoLuong*CTHD.ThanhTien)
	FROM dbo.ChiTietHoaDon AS CTHD INNER JOIN dbo.HoaDon AS HD ON CTHD.MaHD = HD.MaHD
	WHERE MONTH(HD.NgayMua) = @month AND YEAR(HD.NgayMua) = @year
	END
GO
/****** Object:  StoredProcedure [dbo].[proc_SummaryByMonth]    Script Date: 5/21/2022 3:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[proc_SummaryByMonth]
@year INT,
@SummaryOfYear MONEY OUTPUT
AS
	BEGIN
		DECLARE @month INT = 1
		DECLARE @tblSummary TABLE(Month INT)
		WHILE(@month <= 12)
			BEGIN
				INSERT @tblSummary ( Month )
				VALUES  ( @month )
				SET @month += 1
			END
		
		SELECT t1.Month as N'Month', CASE
							WHEN t2.RevenueByMonth IS NULL THEN 0
							ELSE t2.RevenueByMonth
						END AS N'TotalPrice'
		FROM @tblSummary AS t1 
		LEFT JOIN (	SELECT MONTH(HD.NgayMua) AS Month, SUM(CTHD.SoLuong*CTHD.ThanhTien) AS RevenueByMonth
					FROM dbo.ChiTietHoaDon AS CTHD INNER JOIN dbo.HoaDon AS HD ON CTHD.MaHD = HD.MaHD
					WHERE YEAR(HD.NgayMua) = @year
					GROUP BY MONTH(HD.NgayMua)) AS t2 ON t2.Month = t1.Month

		SELECT @SummaryOfYear = SUM(CTHD.SoLuong*CTHD.ThanhTien)
		FROM dbo.ChiTietHoaDon AS CTHD INNER JOIN dbo.HoaDon AS HD ON CTHD.MaHD = HD.MaHD
		WHERE YEAR(HD.NgayMua) = @year
	END
GO
USE [master]
GO
ALTER DATABASE [QlBanPhim] SET  READ_WRITE 
GO
