USE [master]
GO
/****** Object:  Database [ISKSK]    Script Date: 25.11.2017 17:40:27 ******/
CREATE DATABASE [ISKSK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISKSK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\fdsagfasdg.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ISKSK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\fdsagfasdg_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ISKSK] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISKSK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISKSK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISKSK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISKSK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISKSK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISKSK] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISKSK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISKSK] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ISKSK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISKSK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISKSK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISKSK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISKSK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISKSK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISKSK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISKSK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISKSK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISKSK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISKSK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISKSK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISKSK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISKSK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISKSK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISKSK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISKSK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ISKSK] SET  MULTI_USER 
GO
ALTER DATABASE [ISKSK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISKSK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISKSK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISKSK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ISKSK]
GO
/****** Object:  Table [dbo].[Виды услуг]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Виды услуг](
	[ID] [int] NOT NULL,
	[Услуга] [varchar](50) NOT NULL,
	[Цена] [nchar](10) NULL,
 CONSTRAINT [PK_Виды услуг] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Дата ЭП]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Дата ЭП](
	[ID] [int] NOT NULL,
	[Дата ЭП] [date] NULL,
	[ИНН] [varchar](12) NOT NULL,
	[ID Тип отчёта] [int] NOT NULL,
 CONSTRAINT [PK_Дата ЭП] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Клиент](
	[ИНН] [varchar](12) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Телефон] [varchar](15) NOT NULL,
	[E-mail] [varchar](20) NULL,
	[Арес] [varchar](150) NULL,
	[Рег № ПФР] [varchar](max) NULL,
	[Рег № ФСС] [varchar](20) NULL,
	[Отв сотрудник] [int] NOT NULL,
	[Дата открытия] [date] NULL,
	[Дата закрытия] [date] NULL,
	[Согласие на ОПД] [bit] NULL,
	[Договор] [bit] NULL,
	[Примечание] [varchar](max) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[ИНН] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Книга продаж]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Книга продаж](
	[ID] [int] NOT NULL,
	[ИНН] [varchar](12) NOT NULL,
	[Дата] [datetime] NOT NULL,
	[ID Услуги] [int] NOT NULL,
	[ИТОГО] [int] NOT NULL,
	[Отв сотрудик] [int] NOT NULL,
	[Оплата] [datetime] NOT NULL,
	[Примечание] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Книга продаж] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Организация]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Организация](
	[Наименование] [varchar](50) NOT NULL,
	[ИНН] [varchar](12) NOT NULL,
	[ОГРН] [varchar](15) NULL,
	[Адрес] [varchar](100) NULL,
	[Расчетный счкт] [varchar](20) NULL,
	[Банк] [varchar](50) NULL,
	[Телефон] [varchar](50) NULL,
	[Телефон рабочий] [varchar](50) NULL,
	[БИК] [nchar](10) NULL,
	[Расчётный счёт] [nchar](10) NULL,
	[Кор. Счёт] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Отметка за период]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отметка за период](
	[ID] [int] NOT NULL,
	[Дата] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Отслеживание]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Отслеживание](
	[ID Отчёта] [int] NOT NULL,
	[ИНН] [varchar](12) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[ID Типа отчёта] [int] NOT NULL,
 CONSTRAINT [PK_Отслеживание] PRIMARY KEY CLUSTERED 
(
	[ID Отчёта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Периоды отчётов]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Периоды отчётов](
	[ID] [varchar](20) NOT NULL,
	[Период отчёта] [nchar](10) NULL,
 CONSTRAINT [PK_Периоды отчётов] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID] [int] NOT NULL,
	[Фамилия] [varchar](20) NOT NULL,
	[Имя] [varchar](20) NOT NULL,
	[Пароль] [varchar](20) NOT NULL,
	[Примечание] [varchar](255) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Тип отчёта]    Script Date: 25.11.2017 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Тип отчёта](
	[ID] [int] NOT NULL,
	[Тип отчёта] [varchar](15) NOT NULL,
	[Период отчёта] [varchar](20) NULL,
 CONSTRAINT [PK_Тип отчета] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Дата ЭП]  WITH CHECK ADD  CONSTRAINT [FK_Дата ЭП_Клиент] FOREIGN KEY([ИНН])
REFERENCES [dbo].[Клиент] ([ИНН])
GO
ALTER TABLE [dbo].[Дата ЭП] CHECK CONSTRAINT [FK_Дата ЭП_Клиент]
GO
ALTER TABLE [dbo].[Дата ЭП]  WITH CHECK ADD  CONSTRAINT [FK_Дата ЭП_Тип отчёта] FOREIGN KEY([ID Тип отчёта])
REFERENCES [dbo].[Тип отчёта] ([ID])
GO
ALTER TABLE [dbo].[Дата ЭП] CHECK CONSTRAINT [FK_Дата ЭП_Тип отчёта]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Пользователь] FOREIGN KEY([Отв сотрудник])
REFERENCES [dbo].[Пользователь] ([ID])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Пользователь]
GO
ALTER TABLE [dbo].[Книга продаж]  WITH CHECK ADD  CONSTRAINT [FK_Книга продаж_Виды услуг] FOREIGN KEY([ID Услуги])
REFERENCES [dbo].[Виды услуг] ([ID])
GO
ALTER TABLE [dbo].[Книга продаж] CHECK CONSTRAINT [FK_Книга продаж_Виды услуг]
GO
ALTER TABLE [dbo].[Книга продаж]  WITH CHECK ADD  CONSTRAINT [FK_Книга продаж_Клиент] FOREIGN KEY([ИНН])
REFERENCES [dbo].[Клиент] ([ИНН])
GO
ALTER TABLE [dbo].[Книга продаж] CHECK CONSTRAINT [FK_Книга продаж_Клиент]
GO
ALTER TABLE [dbo].[Книга продаж]  WITH CHECK ADD  CONSTRAINT [Книга продаж_fk2] FOREIGN KEY([Отв сотрудик])
REFERENCES [dbo].[Пользователь] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Книга продаж] CHECK CONSTRAINT [Книга продаж_fk2]
GO
ALTER TABLE [dbo].[Отметка за период]  WITH CHECK ADD  CONSTRAINT [FK_Отметка за период_Отслеживание] FOREIGN KEY([ID])
REFERENCES [dbo].[Отслеживание] ([ID Отчёта])
GO
ALTER TABLE [dbo].[Отметка за период] CHECK CONSTRAINT [FK_Отметка за период_Отслеживание]
GO
ALTER TABLE [dbo].[Отслеживание]  WITH CHECK ADD  CONSTRAINT [FK_Отслеживание_Клиент] FOREIGN KEY([ИНН])
REFERENCES [dbo].[Клиент] ([ИНН])
GO
ALTER TABLE [dbo].[Отслеживание] CHECK CONSTRAINT [FK_Отслеживание_Клиент]
GO
ALTER TABLE [dbo].[Отслеживание]  WITH CHECK ADD  CONSTRAINT [FK_Отслеживание_Тип отчета] FOREIGN KEY([ID Типа отчёта])
REFERENCES [dbo].[Тип отчёта] ([ID])
GO
ALTER TABLE [dbo].[Отслеживание] CHECK CONSTRAINT [FK_Отслеживание_Тип отчета]
GO
ALTER TABLE [dbo].[Тип отчёта]  WITH CHECK ADD  CONSTRAINT [FK_Тип отчёта_Периоды отчётов] FOREIGN KEY([Период отчёта])
REFERENCES [dbo].[Периоды отчётов] ([ID])
GO
ALTER TABLE [dbo].[Тип отчёта] CHECK CONSTRAINT [FK_Тип отчёта_Периоды отчётов]
GO
USE [master]
GO
ALTER DATABASE [ISKSK] SET  READ_WRITE 
GO
