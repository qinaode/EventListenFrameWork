USE [master]
GO
/****** Object:  Database [ListenEvent]    Script Date: 04/11/2015 12:27:38 ******/
CREATE DATABASE [ListenEvent] ON  PRIMARY 
( NAME = N'ListenEvent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ListenEvent.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ListenEvent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ListenEvent_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ListenEvent] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ListenEvent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ListenEvent] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ListenEvent] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ListenEvent] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ListenEvent] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ListenEvent] SET ARITHABORT OFF
GO
ALTER DATABASE [ListenEvent] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ListenEvent] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ListenEvent] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ListenEvent] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ListenEvent] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ListenEvent] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ListenEvent] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ListenEvent] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ListenEvent] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ListenEvent] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ListenEvent] SET  ENABLE_BROKER
GO
ALTER DATABASE [ListenEvent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ListenEvent] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ListenEvent] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ListenEvent] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ListenEvent] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ListenEvent] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ListenEvent] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ListenEvent] SET  READ_WRITE
GO
ALTER DATABASE [ListenEvent] SET RECOVERY FULL
GO
ALTER DATABASE [ListenEvent] SET  MULTI_USER
GO
ALTER DATABASE [ListenEvent] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ListenEvent] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ListenEvent', N'ON'
GO
USE [ListenEvent]
GO
/****** Object:  Table [dbo].[LE_EventQueue]    Script Date: 04/11/2015 12:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LE_EventQueue](
	[EventID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EventContent] [nvarchar](max) NULL,
	[EventType] [int] NULL,
	[CreatTime] [datetime] NULL,
 CONSTRAINT [PK_LE_EventQueue] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LE_EventList]    Script Date: 04/11/2015 12:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LE_EventList](
	[EventID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[EventContent] [nvarchar](max) NULL,
	[EventType] [int] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_LE_EventList] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [tg_insert_EventQueue]    Script Date: 04/11/2015 12:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tg_insert_EventQueue]
on [dbo].[LE_EventList] for insert
as
	insert into dbo.LE_EventQueue select * from inserted
GO
/****** Object:  Default [DF_LE_EventQueue_EventID]    Script Date: 04/11/2015 12:27:38 ******/
ALTER TABLE [dbo].[LE_EventQueue] ADD  CONSTRAINT [DF_LE_EventQueue_EventID]  DEFAULT (newid()) FOR [EventID]
GO
/****** Object:  Default [DF_LE_EventList_EventID]    Script Date: 04/11/2015 12:27:38 ******/
ALTER TABLE [dbo].[LE_EventList] ADD  CONSTRAINT [DF_LE_EventList_EventID]  DEFAULT (newid()) FOR [EventID]
GO
/****** Object:  Default [DF_LE_EventList_CreateTime]    Script Date: 04/11/2015 12:27:38 ******/
ALTER TABLE [dbo].[LE_EventList] ADD  CONSTRAINT [DF_LE_EventList_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
