USE [master]
GO
/****** Object:  Database [DBDoorBuilder]    Script Date: 4/29/2022 3:19:35 PM ******/
CREATE DATABASE [DBDoorBuilder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBDoorBuilder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBDoorBuilder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBDoorBuilder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBDoorBuilder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBDoorBuilder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBDoorBuilder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBDoorBuilder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBDoorBuilder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBDoorBuilder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBDoorBuilder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBDoorBuilder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET RECOVERY FULL 
GO
ALTER DATABASE [DBDoorBuilder] SET  MULTI_USER 
GO
ALTER DATABASE [DBDoorBuilder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBDoorBuilder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBDoorBuilder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBDoorBuilder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBDoorBuilder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBDoorBuilder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBDoorBuilder', N'ON'
GO
ALTER DATABASE [DBDoorBuilder] SET QUERY_STORE = OFF
GO
USE [DBDoorBuilder]
GO
/****** Object:  Table [dbo].[DoorBuilderDetails]    Script Date: 4/29/2022 3:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoorBuilderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Numerals] [int] NULL,
	[Address] [varchar](2500) NULL,
	[PostCode] [varchar](100) NULL,
	[Block] [varchar](250) NULL,
	[Floor] [varchar](250) NULL,
	[Location] [varchar](500) NULL,
	[Width] [decimal](10, 5) NULL,
	[Height] [decimal](10, 5) NULL,
	[FireRating] [varchar](100) NULL,
	[FrameMaterial] [varchar](1000) NULL,
	[DoorThickness] [varchar](1000) NULL,
	[FrameFinish] [varchar](1000) NULL,
	[RainDeflector] [varchar](10) NULL,
	[DoorOpens] [varchar](100) NULL,
	[HingedSide] [varchar](250) NULL,
	[DoorStyle] [varchar](250) NULL,
	[ExternalColour] [varchar](250) NULL,
	[InternalColour] [varchar](250) NULL,
	[Chain] [varchar](10) NULL,
	[LetterPlate] [varchar](10) NULL,
	[DoorKnocker] [varchar](10) NULL,
	[LockOptions] [varchar](2500) NULL,
	[Spyhole1200mm] [varchar](10) NULL,
	[Spyhole1500mm] [varchar](10) NULL,
	[ExternalHardwareFinish] [varchar](1000) NULL,
	[Closer] [varchar](2500) NULL,
	[Threshold] [varchar](1000) NULL,
	[Notes] [varchar](1000) NULL,
 CONSTRAINT [PK_DoorBuilderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DoorBuilderDetails] ON 
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (4, 1, N'1, Ack Test', N'ACKT 0209', N'A', N'GRD', NULL, CAST(1320.00000 AS Decimal(10, 5)), CAST(2050.00000 AS Decimal(10, 5)), N'FD30', N'Softwood', N'Flamebreak 44mm', N'Black', N'Yes', N'In', N'Right', N'Warwick (6p)', N'Blue', N'Same as External', N'Yes', N'Yes', N'Yes', N'Lever Handle with single point lock and euro cylinder', N'No', N'Yes', N'Polished Chrome', N'Responder 24 Electromatic Closer Satin Silver', N'MXS 15 + 145x15 Saddle', N'TEST ORDER')
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (5, 2, N'2, Ack Test', N'ACKT 0209', N'B', N'1ST', NULL, CAST(1300.00000 AS Decimal(10, 5)), CAST(2200.00000 AS Decimal(10, 5)), N'FD30', N'Softwood', N'Flamebreak 44mm', N'Ral 9003 White', N'Yes', N'Out', N'Right', N'Bodiam (F1GC)', N'White', N'Same as External', N'Yes', N'Yes', N'Yes', N'AV2 SBD Normal Cylinder', N'No', N'Yes', N'Polished Chrome', N'ITS11204 Concealed Overhead Cam Action Closer', N'MXS/15-67 and 110x20 Half Saddle', N'TEST')
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (6, 3, N'3, Ack Test', N'ACKT 0209', N'C', N'2ND', NULL, CAST(890.00000 AS Decimal(10, 5)), CAST(2000.00000 AS Decimal(10, 5)), N'FD30', N'Hardwood', N'Flamebreak 44mm', N'Ral 9003 White', N'No', N'In', N'Left', N'Leeds (flg)', N'Black', N'Same as External', N'Yes', N'Yes', N'Yes', N'AV2 SBD Master Suited Cylinder', N'Yes', N'Yes', N'Polished Chrome', N'TS11204 Surface Mounted Cam Action Closer Satin Silver', N'90X15 Tie Bar', N'TEST')
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (7, 1, N'1, Ack Test', N'ACKT 0209', N'A', N'GRD', NULL, CAST(1320.00000 AS Decimal(10, 5)), CAST(2050.00000 AS Decimal(10, 5)), N'FD30', N'Softwood', N'Flamebreak 44mm', N'Black', N'Yes', N'In', N'Right', N'Warwick (6p)', N'Blue', N'Same as External', N'Yes', N'Yes', N'Yes', N'Lever Handle with single point lock and euro cylinder', N'No', N'Yes', N'Polished Chrome', N'Responder 24 Electromatic Closer Satin Silver', N'MXS 15 + 145x15 Saddle', N'TEST ORDER')
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (8, 2, N'2, Ack Test', N'ACKT 0209', N'B', N'1ST', NULL, CAST(1300.00000 AS Decimal(10, 5)), CAST(2200.00000 AS Decimal(10, 5)), N'FD30', N'Softwood', N'Flamebreak 44mm', N'Ral 9003 White', N'Yes', N'Out', N'Right', N'Bodiam (F1GC)', N'White', N'Same as External', N'Yes', N'Yes', N'Yes', N'AV2 SBD Normal Cylinder', N'No', N'Yes', N'Polished Chrome', N'ITS11204 Concealed Overhead Cam Action Closer', N'MXS/15-67 and 110x20 Half Saddle', N'TEST')
GO
INSERT [dbo].[DoorBuilderDetails] ([ID], [Numerals], [Address], [PostCode], [Block], [Floor], [Location], [Width], [Height], [FireRating], [FrameMaterial], [DoorThickness], [FrameFinish], [RainDeflector], [DoorOpens], [HingedSide], [DoorStyle], [ExternalColour], [InternalColour], [Chain], [LetterPlate], [DoorKnocker], [LockOptions], [Spyhole1200mm], [Spyhole1500mm], [ExternalHardwareFinish], [Closer], [Threshold], [Notes]) VALUES (9, 3, N'3, Ack Test', N'ACKT 0209', N'C', N'2ND', NULL, CAST(890.00000 AS Decimal(10, 5)), CAST(2000.00000 AS Decimal(10, 5)), N'FD30', N'Hardwood', N'Flamebreak 44mm', N'Ral 9003 White', N'No', N'In', N'Left', N'Leeds (flg)', N'Black', N'Same as External', N'Yes', N'Yes', N'Yes', N'AV2 SBD Master Suited Cylinder', N'Yes', N'Yes', N'Polished Chrome', N'TS11204 Surface Mounted Cam Action Closer Satin Silver', N'90X15 Tie Bar', N'TEST')
GO
SET IDENTITY_INSERT [dbo].[DoorBuilderDetails] OFF
GO
USE [master]
GO
ALTER DATABASE [DBDoorBuilder] SET  READ_WRITE 
GO
