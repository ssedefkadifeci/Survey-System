USE [master]
GO
/****** Object:  Database [DBSurveySystem]    Script Date: 05/21/2020 23:48:34 ******/
CREATE DATABASE [DBSurveySystem] ON  PRIMARY 
( NAME = N'DBSurveySystem', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DBSurveySystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBSurveySystem_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\DBSurveySystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBSurveySystem] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSurveySystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSurveySystem] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBSurveySystem] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBSurveySystem] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBSurveySystem] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBSurveySystem] SET ARITHABORT OFF
GO
ALTER DATABASE [DBSurveySystem] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBSurveySystem] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBSurveySystem] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBSurveySystem] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBSurveySystem] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBSurveySystem] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBSurveySystem] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBSurveySystem] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBSurveySystem] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBSurveySystem] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBSurveySystem] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBSurveySystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBSurveySystem] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBSurveySystem] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBSurveySystem] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBSurveySystem] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBSurveySystem] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBSurveySystem] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBSurveySystem] SET  READ_WRITE
GO
ALTER DATABASE [DBSurveySystem] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DBSurveySystem] SET  MULTI_USER
GO
ALTER DATABASE [DBSurveySystem] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBSurveySystem] SET DB_CHAINING OFF
GO
USE [DBSurveySystem]
GO
/****** Object:  Table [dbo].[TBL_STUDENT]    Script Date: 05/21/2020 23:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_STUDENT](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_NAME] [nvarchar](20) NOT NULL,
	[S_EMAIL] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[S_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_STUDENT] ON
INSERT [dbo].[TBL_STUDENT] ([S_ID], [S_NAME], [S_EMAIL]) VALUES (1, N'sedef', N'sedef@gmail.com')
SET IDENTITY_INSERT [dbo].[TBL_STUDENT] OFF
/****** Object:  Table [dbo].[TBL_ADMIN]    Script Date: 05/21/2020 23:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ADMIN](
	[AD_ID] [int] IDENTITY(1,1) NOT NULL,
	[AD_NAME] [nvarchar](20) NOT NULL,
	[AD_PASSWORD] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AD_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AD_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_ADMIN] ON
INSERT [dbo].[TBL_ADMIN] ([AD_ID], [AD_NAME], [AD_PASSWORD]) VALUES (1, N'root', N'admin')
INSERT [dbo].[TBL_ADMIN] ([AD_ID], [AD_NAME], [AD_PASSWORD]) VALUES (2, N'Admin', N'admin')
SET IDENTITY_INSERT [dbo].[TBL_ADMIN] OFF
/****** Object:  Table [dbo].[tbl_category]    Script Date: 05/21/2020 23:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_fk_adid] [int] NULL,
	[cat_encyptedstring] [nvarchar](max) NULL,
 CONSTRAINT [PK__tbl_cate__DD5DDDBD6C190EBB] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_fk_adid], [cat_encyptedstring]) VALUES (11, N'asp.NET & MVC', 1, N'x8gvgkKOZ79yQ5RCdeEbcrKBvClxBQtk')
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_fk_adid], [cat_encyptedstring]) VALUES (12, N'HTML5', 1, N'SmZer9kZD7qN3lx3jHTKWg==')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
/****** Object:  Table [dbo].[TBL_SETSURVEY]    Script Date: 05/21/2020 23:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SETSURVEY](
	[SURVEY_ID] [int] IDENTITY(1,1) NOT NULL,
	[SURVEY_DATE] [datetime] NULL,
	[SURVEY_FK_STU] [int] NULL,
	[SURVEY_NAME] [nvarchar](50) NOT NULL,
	[SURVEY_STD_SCORE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SURVEY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_QUESTIONS]    Script Date: 05/21/2020 23:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_QUESTIONS](
	[QUESTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[Q_TEXT] [nvarchar](max) NOT NULL,
	[OPA] [nvarchar](max) NOT NULL,
	[OPB] [nvarchar](max) NOT NULL,
	[OPC] [nvarchar](max) NOT NULL,
	[OPD] [nvarchar](max) NOT NULL,
	[COP] [nvarchar](max) NOT NULL,
	[Q_TYPE] [nvarchar](20) NULL,
	[q_fk_catid] [int] NULL,
 CONSTRAINT [PK__TBL_QUES__30BE07AD060DEAE8] PRIMARY KEY CLUSTERED 
(
	[QUESTION_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_QUESTIONS] ON
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [Q_TYPE], [q_fk_catid]) VALUES (11, N'What is HTML ?', N'HYPER TEXT MARKUP LANGUAGE', N'HYPER', N'HYPER TEXT LANGUAGE', N'TEXT LANGUAGE', N'HYPER TEXT MARKUP LANGUAGE', NULL, 12)
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [Q_TYPE], [q_fk_catid]) VALUES (12, N'What tag is used for line change?', N'br', N'hr', N'c', N'a', N'br', NULL, 12)
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [Q_TYPE], [q_fk_catid]) VALUES (13, N'What is MVC?', N'Model View Controller', N'Model View', N'Model Controller', N'Web APP', N'Model View Controller', NULL, 11)
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [Q_TYPE], [q_fk_catid]) VALUES (14, N'What is Abstract Class?', N'data hiding', N'data bining', N'data modelling', N'data showing', N'data  hiding', NULL, 11)
SET IDENTITY_INSERT [dbo].[TBL_QUESTIONS] OFF
/****** Object:  ForeignKey [FK__tbl_categ__cat_f__6E01572D]    Script Date: 05/21/2020 23:48:35 ******/
ALTER TABLE [dbo].[tbl_category]  WITH CHECK ADD  CONSTRAINT [FK__tbl_categ__cat_f__6E01572D] FOREIGN KEY([cat_fk_adid])
REFERENCES [dbo].[TBL_ADMIN] ([AD_ID])
GO
ALTER TABLE [dbo].[tbl_category] CHECK CONSTRAINT [FK__tbl_categ__cat_f__6E01572D]
GO
/****** Object:  ForeignKey [FK__TBL_SETSU__SURVE__1DE57479]    Script Date: 05/21/2020 23:48:35 ******/
ALTER TABLE [dbo].[TBL_SETSURVEY]  WITH CHECK ADD FOREIGN KEY([SURVEY_FK_STU])
REFERENCES [dbo].[TBL_STUDENT] ([S_ID])
GO
/****** Object:  ForeignKey [FK__TBL_QUEST__q_fk___6EF57B66]    Script Date: 05/21/2020 23:48:35 ******/
ALTER TABLE [dbo].[TBL_QUESTIONS]  WITH CHECK ADD  CONSTRAINT [FK__TBL_QUEST__q_fk___6EF57B66] FOREIGN KEY([q_fk_catid])
REFERENCES [dbo].[tbl_category] ([cat_id])
GO
ALTER TABLE [dbo].[TBL_QUESTIONS] CHECK CONSTRAINT [FK__TBL_QUEST__q_fk___6EF57B66]
GO
