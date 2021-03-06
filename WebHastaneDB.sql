USE [master]
GO
/****** Object:  Database [WebHastaneDB]    Script Date: 21.03.2018 16:50:29 ******/
CREATE DATABASE [WebHastaneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebHastaneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebHastaneDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebHastaneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebHastaneDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebHastaneDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebHastaneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebHastaneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebHastaneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebHastaneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebHastaneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebHastaneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebHastaneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebHastaneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebHastaneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebHastaneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebHastaneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebHastaneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebHastaneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebHastaneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebHastaneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebHastaneDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebHastaneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebHastaneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebHastaneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebHastaneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebHastaneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebHastaneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebHastaneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebHastaneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WebHastaneDB] SET  MULTI_USER 
GO
ALTER DATABASE [WebHastaneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebHastaneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebHastaneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebHastaneDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebHastaneDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebHastaneDB', N'ON'
GO
USE [WebHastaneDB]
GO
/****** Object:  Table [dbo].[hastaKabul]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hastaKabul](
	[hastaKabulID] [int] IDENTITY(1,1) NOT NULL,
	[sikayet] [text] NULL,
	[doktorID] [int] NOT NULL,
	[poliklinikID] [int] NOT NULL,
	[randevuID] [int] NULL,
	[RandevuDurumu] [nchar](10) NULL,
	[hastaID] [int] NULL,
 CONSTRAINT [PK__hastaKab__B8C40B5D42BD6E5C] PRIMARY KEY CLUSTERED 
(
	[hastaKabulID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hastalar]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hastalar](
	[hastaID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [varchar](15) NOT NULL,
	[SOYAD] [varchar](15) NOT NULL,
	[ŞİFRE] [varchar](8) NULL,
	[ADRES] [text] NULL,
	[TELEFON] [varchar](15) NULL,
	[TC] [nvarchar](11) NOT NULL,
	[DOĞUM TARİHİ] [date] NULL,
	[CİNSİYET] [char](10) NULL,
	[MEDENİ HAL] [varchar](5) NULL,
	[kayıtTarihi] [datetime] NULL,
 CONSTRAINT [PK__hastalar__573D9C49D8434B79] PRIMARY KEY CLUSTERED 
(
	[hastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hastaSikayetleri]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hastaSikayetleri](
	[hastaSikayetID] [int] IDENTITY(1,1) NOT NULL,
	[tarih] [datetime] NULL,
	[hastaSikayeti] [text] NULL,
	[hastaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hastaSikayetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ilaclar]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ilaclar](
	[ilacId] [int] IDENTITY(1,1) NOT NULL,
	[barkod] [bigint] NOT NULL,
	[ilacAdi] [varchar](2000) NOT NULL,
	[etkenMadde] [text] NULL,
	[birim] [money] NULL,
	[birimCins] [nvarchar](20) NULL,
	[farmaForm] [nvarchar](20) NULL,
	[ambalaj] [nvarchar](20) NULL,
	[ambalajBirimi] [nvarchar](20) NULL,
	[firma] [nvarchar](20) NULL,
	[ithalImal] [nvarchar](20) NULL,
	[fiyatı] [money] NULL,
 CONSTRAINT [PK__ilaclar__C641DC756252E6DC] PRIMARY KEY CLUSTERED 
(
	[ilacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[muayeneler]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muayeneler](
	[muayeneID] [int] IDENTITY(1,1) NOT NULL,
	[tarih] [datetime] NULL,
	[doktorID] [int] NULL,
	[hastaID] [int] NULL,
	[randevuID] [int] NULL,
	[Istenilen Tahliller] [nvarchar](50) NULL,
	[Istenilen Testler] [nvarchar](50) NULL,
	[Detay] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[muayeneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personeller]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[personeller](
	[personelID] [int] NOT NULL,
	[AD] [varchar](15) NOT NULL,
	[SOYAD] [varchar](15) NOT NULL,
	[ŞİFRE] [nchar](6) NOT NULL,
	[ADRES] [varchar](100) NULL,
	[CİNSİYET] [bit] NOT NULL,
	[E-POSTA] [varchar](30) NOT NULL,
	[DOĞUM TARİHİ] [datetime] NULL,
	[unvanID] [int] NOT NULL,
	[klinikID] [int] NULL,
 CONSTRAINT [PK__personel__C0E7528DEC4B9FA6] PRIMARY KEY CLUSTERED 
(
	[personelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[poliklinikler]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[poliklinikler](
	[poliklinikID] [int] IDENTITY(1,1) NOT NULL,
	[poliklinikAdi] [varchar](60) NOT NULL,
	[randevuSure] [int] NULL,
	[hastaneID] [int] NULL,
 CONSTRAINT [PK__poliklin__3CA854EDACBBA5FA] PRIMARY KEY CLUSTERED 
(
	[poliklinikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[randevular]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[randevular](
	[randevuID] [int] IDENTITY(1,1) NOT NULL,
	[RandevuTarihi] [date] NULL,
	[RansevuSaati] [nchar](5) NULL,
	[hastaID] [int] NULL,
	[personelID] [int] NULL,
	[poliklinikID] [int] NULL,
 CONSTRAINT [PK__randevul__7FA569AA0483354A] PRIMARY KEY CLUSTERED 
(
	[randevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[receteler]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receteler](
	[receteNo] [int] IDENTITY(1,1) NOT NULL,
	[tarih] [datetime] NOT NULL,
	[doktorID] [int] NOT NULL,
	[hastaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[receteNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recetelerSatirlari]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recetelerSatirlari](
	[satırID] [int] IDENTITY(1,1) NOT NULL,
	[ilacID] [int] NULL,
	[dozu] [varchar](20) NULL,
	[kullanımSekli] [varchar](20) NULL,
	[adet] [int] NULL,
	[receteNo] [int] NULL,
	[barkod] [int] NULL,
 CONSTRAINT [PK__recetele__ADA0256DC6CE17C2] PRIMARY KEY CLUSTERED 
(
	[satırID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tahliller]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tahliller](
	[tahlilID] [int] IDENTITY(1,1) NOT NULL,
	[tahlilAdi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tahlilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tahlillerSonuc]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tahlillerSonuc](
	[tahlilSonucID] [int] IDENTITY(1,1) NOT NULL,
	[aciklama] [text] NULL,
	[sonuc] [text] NULL,
	[tahlilID] [int] NOT NULL,
	[hastaID] [int] NULL,
	[doktorID] [int] NULL,
	[hemşireID] [int] NULL,
 CONSTRAINT [PK__tahlille__7DDEA475B650E3EF] PRIMARY KEY CLUSTERED 
(
	[tahlilSonucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teshisler]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teshisler](
	[teshisID] [int] IDENTITY(1,1) NOT NULL,
	[tarih] [date] NULL,
	[teshis] [varchar](25) NULL,
	[doktorID] [int] NULL,
	[muayeneID] [int] NULL,
 CONSTRAINT [PK__teshisle__B07AA393B0B3DEFC] PRIMARY KEY CLUSTERED 
(
	[teshisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unvanlar]    Script Date: 21.03.2018 16:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[unvanlar](
	[unvanID] [int] IDENTITY(1,1) NOT NULL,
	[unvanAdi] [varchar](20) NOT NULL,
	[personelTuru] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[unvanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[hastalar] ON 

INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (1, N'Mehmet', N'Alkan', N'999999', N'Mecidiyeköy', N'5443457898', N'54467898782', CAST(N'2018-03-17' AS Date), N'Erkek     ', N'Evli', CAST(N'2018-03-20 21:16:45.290' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (2, N'Aslıhan', N'Peker', N'123456', N'Dudullu', N'05466453524', N'39361947822', CAST(N'1993-12-28' AS Date), N'Kadın     ', N'Bekar', CAST(N'2018-03-20 21:22:30.437' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (3, N'Musa', N'Çakmak', N'222222', N'Beşiktaş', N'05466577895', N'34546576789', CAST(N'2010-03-23' AS Date), N'Erkek     ', N'Bekar', CAST(N'2018-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (6, N'ali', N'bayrakçı', N'909090', NULL, NULL, N'39372834855', NULL, N'Erkek     ', N'Evli', CAST(N'2018-03-20 19:59:23.520' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (7, N'Ali', N'Peker', N'121212', NULL, NULL, N'39372834855', CAST(N'1990-12-28' AS Date), N'Erkek     ', N'2', CAST(N'2018-03-10 03:57:21.000' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (9, N'asya', N'yılmaz', N'323232', N'sxcvbnmj', N'1234567890', N'39372834855', CAST(N'1987-10-23' AS Date), NULL, N'2', CAST(N'2018-03-10 04:27:43.503' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (10, N'ali barış', N'Peker', N'654321', N'yeşilova Sk.', N'5466577687', N'39358947995', CAST(N'1995-09-06' AS Date), NULL, NULL, CAST(N'2018-03-10 05:01:30.647' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (11, N'fdg', N'dgdg', N'444444', N'ydgvdvd', N'5554655454', N'39372834855', CAST(N'2018-03-08' AS Date), NULL, NULL, CAST(N'2018-03-10 05:04:06.243' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (12, N'fgdf', N'dgdsg', N'434343', N'gdg', N'5454545454', N'39372834855', CAST(N'2018-03-15' AS Date), NULL, NULL, CAST(N'2018-03-10 05:17:35.327' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (13, N'asya', N'sdfghjk', N'123434', NULL, N'5656464565', N'12345678987', CAST(N'2018-03-17' AS Date), NULL, NULL, CAST(N'2018-03-10 19:14:28.610' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (14, N'gamze', N'erkoç', N'333333', NULL, N'5677679887', N'38646464544', CAST(N'1985-06-13' AS Date), NULL, NULL, CAST(N'2018-03-10 21:58:07.797' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (15, N'faf', N'sfsdf', N'123445', NULL, N'5433456789', N'dgdsg', CAST(N'2018-03-22' AS Date), N'Kadın     ', NULL, CAST(N'2018-03-10 22:24:18.730' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (16, N'adasf', N'faefef', N'666666', NULL, N'5454545454', N'34534345433', CAST(N'2018-03-22' AS Date), N'Erkek     ', NULL, CAST(N'2018-03-12 14:04:34.870' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (17, N'bahadır', N'erbay', N'654321', NULL, N'5466577687', N'34073258517', CAST(N'2018-03-07' AS Date), N'Erkek     ', NULL, CAST(N'2018-03-12 18:41:07.173' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (18, N'memet', N'çevik', N'12345678', NULL, N'5677643565', N'65743287633', CAST(N'1995-06-14' AS Date), N'Erkek     ', NULL, CAST(N'2018-03-12 18:55:43.743' AS DateTime))
INSERT [dbo].[hastalar] ([hastaID], [AD], [SOYAD], [ŞİFRE], [ADRES], [TELEFON], [TC], [DOĞUM TARİHİ], [CİNSİYET], [MEDENİ HAL], [kayıtTarihi]) VALUES (19, N'Gülsevim', N'Bardak', N'654321', NULL, N'5466645343', N'50368471936', CAST(N'1988-03-03' AS Date), NULL, NULL, CAST(N'2018-03-21 16:34:39.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[hastalar] OFF
SET IDENTITY_INSERT [dbo].[ilaclar] ON 

INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (3, 8699514012184, N'NORVADIN 10 MG 30 TABLET', N'Amlodipin Besilat', 10.0000, N'MG', N'TABLET', N'30', N'TABLET', N'A.IBRAHIM', N'İMAL', 15.7800)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (4, 8698622750018, N'GENSİF 20 MG/2 ML AMPÜL', N'Gentamisin Sulfat', 20.0000, N'MG', N'AMPUL', N'1', N'AMPUL', N'AVICENNA', N'İMAL', 0.2900)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (5, 8699832750034, N'ARVELES 50 MG/ 2 ML ENJEKTABL ÇÖZELTİ İÇEREN 20 AMPÜL', N'Deksketoprofen Trometamol', 50.0000, N'MG', N'AMPUL', N'20', N'AMPUL', N'UFSA', N'İTHAL', 37.0200)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (6, 8699832750010, N'ARVELES 50 MG/ 2 ML ENJEKTABL ÇÖZELTİ İÇEREN 6 AMPÜL', N'Deksketoprofen Trometamol', 50.0000, N'MG', N'AMPUL', N'6', N'AMPUL', N'UFSA', N'İTHAL', 11.1100)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (7, 8699504011364, N'VENORUTON FORTE 500 MG 60 TABLET', N'Okserutin', 500.0000, N'MG', N'TABLET', N'60', N'TABLET', N'NOVARTİS', N'İMAL', 31.0400)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (8, 8699676950423, N'MIXTARD 10 HM 100 IU 5X3 ML KARTUŞ', N'İnsülin', 100.0000, N'IU', N'KUL.HAZ.ENJ.PREP.', N'5', N'KARTUŞ', N'NOVO NORDISK', N'İTHAL', 0.0000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (9, 8699540096059, N'ESRAM 20 MG 28 TABLET', N'Essitalopram', 20.0000, N'MG', N'TABLET', N'28', N'TABLET', N'NOBEL', N'İMAL', 34.7500)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (10, 8699540015135, N'MELOX FORT 15 MG 10 TABLET', N'Meloksikam', 15.0000, N'MG', N'TABLET', N'10', N'TABLET', N'NOBEL', N'İMAL', 4.5900)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (11, 8699540160101, N'OMEPRAZID 20 MG 14 KAPSÜL', N'Omeprazol', 20.0000, N'MG', N'KAPSÜL', N'14', N'KAPSUL', N'NOBEL', N'İMAL', 3.6000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (12, 8699638012848, N'DOSİNTEVA 2 MG 20 TABLET', N'Doksazosin Mesilat', 2.0000, N'MG', N'TABLET', N'20', N'TABLET', N'MED ILAÇ', N'İTHAL', 7.2400)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (13, 8699638012107, N'TAMOPLEX 20 MG 30 TABLET', N'Tamoksifen Sitrat', 20.0000, N'MG', N'TABLET', N'30', N'TABLET', N'MED ILAÇ', N'İTHAL', 14.7000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (14, 8699540096011, N'ESRAM 10 MG 28 TABLET', N'Essitalopram', 10.0000, N'MG', N'TABLET', N'28', N'TABLET', N'NOBEL', N'İMAL', 21.1700)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (15, 8699831750011, N'KETESSE 50 MG/2 ML ENJ. ÇÖZELTİ İÇEREN 6 AMPÜL', N'Deksketoprofen Trometamol', 25.0000, N'MG/ML', N'AMPUL', N'6', N'AMPUL', N'I.E.ULAGAY', N'İTHAL', 11.1100)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (16, 8699828770015, N'ONCOCARBIN 150 MG 15 ML 1FLAKON', N'Karboplatin', 150.0000, N'MG', N'FLAKON', N'15', N'ML', N'KOÇAK-FARMA', N'İMAL', 70.9500)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (17, 8699638012848, N'DOSİNTEVA 4 MG 20 TABLET', N'Doksazosin Mesilat', 4.0000, N'MG', N'TABLET', N'20', N'TABLET', N'MED ILAÇ', N'İTHAL', 9.4900)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (18, 8699502013032, N'TERBİN 250 MG 14 TABLET', N'Terbinafin Hidroklorid', 250.0000, N'MG', N'TABLET', N'14', N'TABLET', N'ECZ.I.SANAYI', N'İMAL', 21.6800)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (19, 8699831750028, N'KETESSE 50 MG/2 ML ENJ. ÇÖZELTİ İÇEREN 10 AMPÜL', N'Deksketoprofen Trometamol', 25.0000, N'MG/ML', N'AMPUL', N'10', N'AMPUL', N'I.E.ULAGAY', N'İTHAL', 18.5100)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (20, 8699831750035, N'KETESSE 50 MG/2 ML ENJ. ÇÖZELTİ İÇEREN 20 AMPÜL', N'Deksketoprofen Trometamol', 25.0000, N'MG/ML', N'AMPUL', N'20', N'AMPUL', N'I.E.ULAGAY', N'İTHAL', 37.0200)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (21, 8699578750138, N'AKROFOLLINE 1ML  5 AMPUL', N'Estradiol Propiyonat', 50000.0000, N'IU', N'AMPUL', N'5', N'AMPUL', N'BİOFARMA', N'İMAL', 1.3200)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (22, 8699582090114, N'ROVAMYCINE 3 MIU 14 TABLET', N'Spiramisin', 3.0000, N'MIU', N'TABLET', N'14', N'TABLET', N'ECZ.I.TICARET', N'İMAL', 14.8000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (23, 8699569280286, N'ZIMAKS  100 MG/5ML 50 ML SUSPANSIYON', N'Sefiksim', 100.0000, N'MG', N'SÜSPANSİYON İÇİN TOZ', N'50', N'ML', N'BILIM', N'İMAL', 4.8000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (24, 8699569090205, N'ZIMAKS  400 MG  5 TABLET', N'Sefiksim', 400.0000, N'MG', N'TABLET', N'5', N'TABLET', N'BILIM', N'İMAL', 7.0600)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (25, 8699569090250, N'ZIMAKS  400 MG 10 TABLET', N'Sefiksim', 400.0000, N'MG', N'TABLET', N'10', N'TABLET', N'BILIM', N'İMAL', 15.8600)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (26, 8699569280095, N'ZİMAKS  100 MG 100 ML SUSPANSIYON', N'Sefiksim', 100.0000, N'MG', N'SÜSPANSİYON İÇİN TOZ', N'100', N'ML', N'BILIM', N'İMAL', 9.6000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (27, 8699580090260, N'LOSARTİL PLUS 100 MG/25MG 28 FİLM TABLET', N'Losartan Potasyum+Hidroklorotiyazid', 125.0000, N'MG', N'FİLM TABLET', N'28', N'FİLM TABLET', N'DROGSAN', N'İMAL', 22.9800)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (28, 8699502151215, N'LOSEFAR 500 MG 12 KAPSÜL', N'Sefaklor Monohidrat', 500.0000, N'MG', N'KAPSÜL', N'12', N'KAPSUL', N'ECZ.I.SANAYI', N'İMAL', 14.8000)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (29, 8699764090031, N'FERRİPROX 500 MG 100 FİLM TABLET', N'Deferipron', 500.0000, N'MG', N'FİLM TABLET', N'100', N'FİLM TABLET', N'CANKAT ILAÇ', N'İTHAL', 174.3500)
INSERT [dbo].[ilaclar] ([ilacId], [barkod], [ilacAdi], [etkenMadde], [birim], [birimCins], [farmaForm], [ambalaj], [ambalajBirimi], [firma], [ithalImal], [fiyatı]) VALUES (30, 8699764090031, N'FERRİPROX 500 MG 100 FİLM TABLET', N'Deferipron', 500.0000, N'MG', N'FİLM TABLET', N'100', N'FİLM TABLET', N'APOTEX İLAÇ', N'İTHAL', 174.3500)
SET IDENTITY_INSERT [dbo].[ilaclar] OFF
INSERT [dbo].[personeller] ([personelID], [AD], [SOYAD], [ŞİFRE], [ADRES], [CİNSİYET], [E-POSTA], [DOĞUM TARİHİ], [unvanID], [klinikID]) VALUES (1, N'ASLIHAN', N'PEKER', N'123456', N'YEŞİLOVA SK.', 1, N'aslipeker12@gmail.com', CAST(N'1993-12-28 00:00:00.000' AS DateTime), 1, 8)
INSERT [dbo].[personeller] ([personelID], [AD], [SOYAD], [ŞİFRE], [ADRES], [CİNSİYET], [E-POSTA], [DOĞUM TARİHİ], [unvanID], [klinikID]) VALUES (2, N'Rıza', N'Gökdemir', N'222222', N'Beşiktaş', 0, N'rızagokdemir@gmail.com', CAST(N'1983-12-02 00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[personeller] ([personelID], [AD], [SOYAD], [ŞİFRE], [ADRES], [CİNSİYET], [E-POSTA], [DOĞUM TARİHİ], [unvanID], [klinikID]) VALUES (3, N'Kaan', N'Baydar', N'111111', N'Kadıköy', 0, N'kaanbaydar@gmail.com', CAST(N'1978-06-05 00:00:00.000' AS DateTime), 2, 3)
SET IDENTITY_INSERT [dbo].[poliklinikler] ON 

INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (1, N'Acil Tıp', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (2, N'Beyin ve Sinir Cerrahisi', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (3, N'Deri ve Zührevi Hastalıkları', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (4, N'Doku ve Organ Nakli Merkezi', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (5, N'Endokrinoloji', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (6, N'Fiziksel Tıp ve Rehabilitasyon', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (7, N'Gastroenteroloji', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (8, N'Genel Cerrahi', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (9, N'Genel Dahiliye', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (10, N'Geriatri', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (11, N'Göğüs Cerrahisi', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (12, N'Göğüs Hastalıkları', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (13, N'Göz Hastalıkları', NULL, NULL)
INSERT [dbo].[poliklinikler] ([poliklinikID], [poliklinikAdi], [randevuSure], [hastaneID]) VALUES (14, N'Hematoloji', NULL, NULL)
SET IDENTITY_INSERT [dbo].[poliklinikler] OFF
SET IDENTITY_INSERT [dbo].[randevular] ON 

INSERT [dbo].[randevular] ([randevuID], [RandevuTarihi], [RansevuSaati], [hastaID], [personelID], [poliklinikID]) VALUES (1, CAST(N'2018-12-23' AS Date), N'9.30 ', 2, 1, 10)
INSERT [dbo].[randevular] ([randevuID], [RandevuTarihi], [RansevuSaati], [hastaID], [personelID], [poliklinikID]) VALUES (2, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[randevular] ([randevuID], [RandevuTarihi], [RansevuSaati], [hastaID], [personelID], [poliklinikID]) VALUES (3, CAST(N'2018-04-28' AS Date), N'09.30', 2, 2, 2)
SET IDENTITY_INSERT [dbo].[randevular] OFF
SET IDENTITY_INSERT [dbo].[unvanlar] ON 

INSERT [dbo].[unvanlar] ([unvanID], [unvanAdi], [personelTuru]) VALUES (1, N'Admin', N'Bilgi İşlem')
INSERT [dbo].[unvanlar] ([unvanID], [unvanAdi], [personelTuru]) VALUES (2, N'Doktor', N'Hekimler')
INSERT [dbo].[unvanlar] ([unvanID], [unvanAdi], [personelTuru]) VALUES (3, N'Hemşire', N'Başhemşire, Hemşire')
INSERT [dbo].[unvanlar] ([unvanID], [unvanAdi], [personelTuru]) VALUES (4, N'Sekreter', NULL)
INSERT [dbo].[unvanlar] ([unvanID], [unvanAdi], [personelTuru]) VALUES (5, N'Başhekim', NULL)
SET IDENTITY_INSERT [dbo].[unvanlar] OFF
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK__hastaKabu__dokto__412EB0B6] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK__hastaKabu__dokto__412EB0B6]
GO
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK__hastaKabu__polik__412EB0B6] FOREIGN KEY([poliklinikID])
REFERENCES [dbo].[poliklinikler] ([poliklinikID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK__hastaKabu__polik__412EB0B6]
GO
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK__hastaKabu__rande__440B1D61] FOREIGN KEY([randevuID])
REFERENCES [dbo].[randevular] ([randevuID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK__hastaKabu__rande__440B1D61]
GO
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK_hastaKabul_hastalar] FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastalar] ([hastaID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK_hastaKabul_hastalar]
GO
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK_hastaKabul_personeller] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK_hastaKabul_personeller]
GO
ALTER TABLE [dbo].[hastaKabul]  WITH CHECK ADD  CONSTRAINT [FK_hastaKabul_poliklinikler] FOREIGN KEY([poliklinikID])
REFERENCES [dbo].[poliklinikler] ([poliklinikID])
GO
ALTER TABLE [dbo].[hastaKabul] CHECK CONSTRAINT [FK_hastaKabul_poliklinikler]
GO
ALTER TABLE [dbo].[hastaSikayetleri]  WITH CHECK ADD  CONSTRAINT [FK__hastaSika__hasta__45F365D3] FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastalar] ([hastaID])
GO
ALTER TABLE [dbo].[hastaSikayetleri] CHECK CONSTRAINT [FK__hastaSika__hasta__45F365D3]
GO
ALTER TABLE [dbo].[muayeneler]  WITH CHECK ADD  CONSTRAINT [FK__muayenele__dokto__4E88ABD4] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[muayeneler] CHECK CONSTRAINT [FK__muayenele__dokto__4E88ABD4]
GO
ALTER TABLE [dbo].[muayeneler]  WITH CHECK ADD FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastaSikayetleri] ([hastaSikayetID])
GO
ALTER TABLE [dbo].[personeller]  WITH CHECK ADD  CONSTRAINT [FK__personell__klini__25869641] FOREIGN KEY([klinikID])
REFERENCES [dbo].[poliklinikler] ([poliklinikID])
GO
ALTER TABLE [dbo].[personeller] CHECK CONSTRAINT [FK__personell__klini__25869641]
GO
ALTER TABLE [dbo].[personeller]  WITH CHECK ADD  CONSTRAINT [FK__personell__unvan__5629CD9C] FOREIGN KEY([unvanID])
REFERENCES [dbo].[unvanlar] ([unvanID])
GO
ALTER TABLE [dbo].[personeller] CHECK CONSTRAINT [FK__personell__unvan__5629CD9C]
GO
ALTER TABLE [dbo].[randevular]  WITH CHECK ADD  CONSTRAINT [FK__randevula__dokto__5812160E] FOREIGN KEY([personelID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[randevular] CHECK CONSTRAINT [FK__randevula__dokto__5812160E]
GO
ALTER TABLE [dbo].[randevular]  WITH CHECK ADD  CONSTRAINT [FK__randevula__hasta__3A81B327] FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastalar] ([hastaID])
GO
ALTER TABLE [dbo].[randevular] CHECK CONSTRAINT [FK__randevula__hasta__3A81B327]
GO
ALTER TABLE [dbo].[randevular]  WITH CHECK ADD  CONSTRAINT [FK__randevula__polik__3C69FB99] FOREIGN KEY([poliklinikID])
REFERENCES [dbo].[poliklinikler] ([poliklinikID])
GO
ALTER TABLE [dbo].[randevular] CHECK CONSTRAINT [FK__randevula__polik__3C69FB99]
GO
ALTER TABLE [dbo].[receteler]  WITH CHECK ADD  CONSTRAINT [FK__receteler__dokto__5AEE82B9] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[receteler] CHECK CONSTRAINT [FK__receteler__dokto__5AEE82B9]
GO
ALTER TABLE [dbo].[receteler]  WITH CHECK ADD  CONSTRAINT [FK__receteler__hasta__5FB337D6] FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastalar] ([hastaID])
GO
ALTER TABLE [dbo].[receteler] CHECK CONSTRAINT [FK__receteler__hasta__5FB337D6]
GO
ALTER TABLE [dbo].[recetelerSatirlari]  WITH CHECK ADD  CONSTRAINT [FK__receteler__recet__5DCAEF64] FOREIGN KEY([receteNo])
REFERENCES [dbo].[receteler] ([receteNo])
GO
ALTER TABLE [dbo].[recetelerSatirlari] CHECK CONSTRAINT [FK__receteler__recet__5DCAEF64]
GO
ALTER TABLE [dbo].[recetelerSatirlari]  WITH CHECK ADD  CONSTRAINT [FK_recetelerSatirlari_ilaclar] FOREIGN KEY([ilacID])
REFERENCES [dbo].[ilaclar] ([ilacId])
GO
ALTER TABLE [dbo].[recetelerSatirlari] CHECK CONSTRAINT [FK_recetelerSatirlari_ilaclar]
GO
ALTER TABLE [dbo].[tahlillerSonuc]  WITH CHECK ADD  CONSTRAINT [FK__tahliller__tahli__5EBF139D] FOREIGN KEY([tahlilID])
REFERENCES [dbo].[tahliller] ([tahlilID])
GO
ALTER TABLE [dbo].[tahlillerSonuc] CHECK CONSTRAINT [FK__tahliller__tahli__5EBF139D]
GO
ALTER TABLE [dbo].[tahlillerSonuc]  WITH CHECK ADD  CONSTRAINT [FK_tahlillerSonuc_hastalar] FOREIGN KEY([hastaID])
REFERENCES [dbo].[hastalar] ([hastaID])
GO
ALTER TABLE [dbo].[tahlillerSonuc] CHECK CONSTRAINT [FK_tahlillerSonuc_hastalar]
GO
ALTER TABLE [dbo].[tahlillerSonuc]  WITH CHECK ADD  CONSTRAINT [FK_tahlillerSonuc_personeller] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[tahlillerSonuc] CHECK CONSTRAINT [FK_tahlillerSonuc_personeller]
GO
ALTER TABLE [dbo].[tahlillerSonuc]  WITH CHECK ADD  CONSTRAINT [FK_tahlillerSonuc_personeller1] FOREIGN KEY([hemşireID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[tahlillerSonuc] CHECK CONSTRAINT [FK_tahlillerSonuc_personeller1]
GO
ALTER TABLE [dbo].[teshisler]  WITH CHECK ADD  CONSTRAINT [FK__teshisler__dokto__60A75C0F] FOREIGN KEY([doktorID])
REFERENCES [dbo].[personeller] ([personelID])
GO
ALTER TABLE [dbo].[teshisler] CHECK CONSTRAINT [FK__teshisler__dokto__60A75C0F]
GO
ALTER TABLE [dbo].[teshisler]  WITH CHECK ADD  CONSTRAINT [FK__teshisler__muaye__619B8048] FOREIGN KEY([muayeneID])
REFERENCES [dbo].[muayeneler] ([muayeneID])
GO
ALTER TABLE [dbo].[teshisler] CHECK CONSTRAINT [FK__teshisler__muaye__619B8048]
GO
USE [master]
GO
ALTER DATABASE [WebHastaneDB] SET  READ_WRITE 
GO
