USE [master]
GO
/****** Object:  Database [ArmyTechTask]    Script Date: 7/30/2020 09:40:22 ص ******/
CREATE DATABASE [ArmyTechTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArmyTechTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ArmyTechTask.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ArmyTechTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ArmyTechTask_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ArmyTechTask] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArmyTechTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArmyTechTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArmyTechTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArmyTechTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArmyTechTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArmyTechTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArmyTechTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArmyTechTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArmyTechTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArmyTechTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArmyTechTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArmyTechTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArmyTechTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArmyTechTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArmyTechTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArmyTechTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArmyTechTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArmyTechTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArmyTechTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArmyTechTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArmyTechTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArmyTechTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArmyTechTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArmyTechTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ArmyTechTask] SET  MULTI_USER 
GO
ALTER DATABASE [ArmyTechTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArmyTechTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArmyTechTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArmyTechTask] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ArmyTechTask]
GO
/****** Object:  Table [dbo].[Field]    Script Date: 7/30/2020 09:40:24 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Field] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Governorate]    Script Date: 7/30/2020 09:40:25 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governorate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Governorate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Neighborhood]    Script Date: 7/30/2020 09:40:25 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Neighborhood](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GovernorateId] [int] NOT NULL,
 CONSTRAINT [PK_Neighborhood] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/30/2020 09:40:25 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[GovernorateId] [int] NOT NULL,
	[NeighborhoodId] [int] NULL,
	[FieldId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTeacher]    Script Date: 7/30/2020 09:40:25 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTeacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_StudentTeacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/30/2020 09:40:25 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Field] ON 

INSERT [dbo].[Field] ([ID], [Name]) VALUES (1, N'Web')
INSERT [dbo].[Field] ([ID], [Name]) VALUES (2, N'Mobile')
INSERT [dbo].[Field] ([ID], [Name]) VALUES (3, N'Network')
INSERT [dbo].[Field] ([ID], [Name]) VALUES (4, N'Embedded')
SET IDENTITY_INSERT [dbo].[Field] OFF
SET IDENTITY_INSERT [dbo].[Governorate] ON 

INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (1, N'Cairo')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (2, N'Alex')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (3, N'Tanta')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (4, N'Damanhur')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (5, N'Banha')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (6, N'Qena')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (7, N'Luxor')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (8, N'Elmansoura')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (9, N'Minya')
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (10, N'Aswan')
SET IDENTITY_INSERT [dbo].[Governorate] OFF
SET IDENTITY_INSERT [dbo].[Neighborhood] ON 

INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (1, N'maadi', 1)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (2, N'nasr city', 1)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (3, N'dokki', 1)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (4, N'smouha', 2)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (5, N'agami', 2)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (6, N'sidi beshr', 2)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (7, N'gaishst', 3)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (8, N'elsayedelbadwy', 3)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (9, N'elsalam', 4)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (10, N'mohafza', 4)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (11, N'salaheldin', 4)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (12, N'rahabatst', 4)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (13, N'ahram', 5)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (14, N'estad', 5)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (15, N'eshara', 5)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (16, N'qenast1', 6)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (17, N'qenast2', 6)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (19, N'abosumble', 7)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (20, N'tesht', 7)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (21, N'mansourast1', 8)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (22, N'mansourast2', 8)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (23, N'minyast1', 9)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (24, N'minyast2', 9)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (25, N'noba', 10)
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (26, N'elsad elaly', 10)
SET IDENTITY_INSERT [dbo].[Neighborhood] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [Name], [BirthDate], [GovernorateId], [NeighborhoodId], [FieldId]) VALUES (8, N'mohamed elfeky', CAST(N'2020-07-24' AS Date), 1, 1, 1)
INSERT [dbo].[Student] ([ID], [Name], [BirthDate], [GovernorateId], [NeighborhoodId], [FieldId]) VALUES (9, N'mohamed nahla', CAST(N'2020-03-12' AS Date), 4, 10, 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate]) VALUES (1, N'Mohamed', CAST(N'1980-06-03' AS Date))
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate]) VALUES (2, N'Ahmed', CAST(N'1990-05-01' AS Date))
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate]) VALUES (3, N'Amr', CAST(N'1995-04-03' AS Date))
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate]) VALUES (4, N'Wessam', CAST(N'1992-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Neighborhood]  WITH CHECK ADD  CONSTRAINT [FK_Neighborhood_Governorate] FOREIGN KEY([GovernorateId])
REFERENCES [dbo].[Governorate] ([ID])
GO
ALTER TABLE [dbo].[Neighborhood] CHECK CONSTRAINT [FK_Neighborhood_Governorate]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Field] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Field] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Field]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Governorate] FOREIGN KEY([GovernorateId])
REFERENCES [dbo].[Governorate] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Governorate]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Neighborhood] FOREIGN KEY([NeighborhoodId])
REFERENCES [dbo].[Neighborhood] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Neighborhood]
GO
ALTER TABLE [dbo].[StudentTeacher]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeacher_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentTeacher] CHECK CONSTRAINT [FK_StudentTeacher_Student]
GO
ALTER TABLE [dbo].[StudentTeacher]  WITH CHECK ADD  CONSTRAINT [FK_StudentTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[StudentTeacher] CHECK CONSTRAINT [FK_StudentTeacher_Teacher]
GO
USE [master]
GO
ALTER DATABASE [ArmyTechTask] SET  READ_WRITE 
GO
