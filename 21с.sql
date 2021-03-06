USE [master]
GO
/****** Object:  Database [Pr21]    Script Date: 14.05.2022 10:20:21 ******/
CREATE DATABASE [Pr21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pr21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pr21.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Pr21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pr21_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pr21] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pr21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pr21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pr21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pr21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pr21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pr21] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pr21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pr21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pr21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pr21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pr21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pr21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pr21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pr21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pr21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pr21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pr21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pr21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pr21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pr21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pr21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pr21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pr21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pr21] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pr21] SET  MULTI_USER 
GO
ALTER DATABASE [Pr21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pr21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pr21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pr21] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Pr21] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pr21] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pr21] SET QUERY_STORE = OFF
GO
USE [Pr21]
GO
/****** Object:  Table [dbo].[DirectoryOfEmployees]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectoryOfEmployees](
	[ServiceNumber] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Discharge] [int] NOT NULL,
	[Factory] [int] NOT NULL,
 CONSTRAINT [PK_DirectoryOfEmployees] PRIMARY KEY CLUSTERED 
(
	[ServiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfFactory]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfFactory](
	[FactoryNumber] [int] NOT NULL,
	[FactoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ListOfFactory] PRIMARY KEY CLUSTERED 
(
	[FactoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportCard]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportCard](
	[ServiceNumber] [int] NOT NULL,
	[TimeWorkedInHours] [int] NULL,
	[MonthNumber] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_ReportCard] PRIMARY KEY CLUSTERED 
(
	[ServiceNumber] ASC,
	[MonthNumber] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TariffReference]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TariffReference](
	[Discharge] [int] NOT NULL,
	[Rate] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_TariffReference] PRIMARY KEY CLUSTERED 
(
	[Discharge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (1234, N'Комов', 4, 1)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (1456, N'Федюшин', 4, 1)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (2458, N'Олов', 2, 2)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (2589, N'Ладыкин', 1, 2)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (3698, N'Чубаренко', 3, 3)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (3856, N'Фисов', 1, 3)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (4596, N'Самаков', 2, 4)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (4789, N'Иронтьев', 6, 4)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (5236, N'Чомов', 5, 5)
INSERT [dbo].[DirectoryOfEmployees] ([ServiceNumber], [Surname], [Discharge], [Factory]) VALUES (5321, N'Калион', 1, 5)
GO
INSERT [dbo].[ListOfFactory] ([FactoryNumber], [FactoryName]) VALUES (1, N'Торгхол')
INSERT [dbo].[ListOfFactory] ([FactoryNumber], [FactoryName]) VALUES (2, N'Мебельный')
INSERT [dbo].[ListOfFactory] ([FactoryNumber], [FactoryName]) VALUES (3, N'Кузовной')
INSERT [dbo].[ListOfFactory] ([FactoryNumber], [FactoryName]) VALUES (4, N'Сварочный')
INSERT [dbo].[ListOfFactory] ([FactoryNumber], [FactoryName]) VALUES (5, N'Шоколадный')
GO
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (1234, 1979, 10, 2021)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (1456, 456, 5, 2019)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (2458, 879, 7, 2021)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (2589, 1200, 11, 2021)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (3698, 1400, 12, 2020)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (3856, 1863, 11, 2021)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (4596, 742, 8, 2017)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (4789, 963, 5, 2018)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (5236, 450, 3, 2015)
INSERT [dbo].[ReportCard] ([ServiceNumber], [TimeWorkedInHours], [MonthNumber], [Year]) VALUES (5321, 136, 1, 2022)
GO
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (1, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (2, CAST(508 AS Decimal(18, 0)))
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (3, CAST(642 AS Decimal(18, 0)))
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (4, CAST(749 AS Decimal(18, 0)))
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (5, CAST(845 AS Decimal(18, 0)))
INSERT [dbo].[TariffReference] ([Discharge], [Rate]) VALUES (6, CAST(1200 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[DirectoryOfEmployees]  WITH CHECK ADD  CONSTRAINT [FK_DirectoryOfEmployees_ListOfFactory] FOREIGN KEY([Factory])
REFERENCES [dbo].[ListOfFactory] ([FactoryNumber])
GO
ALTER TABLE [dbo].[DirectoryOfEmployees] CHECK CONSTRAINT [FK_DirectoryOfEmployees_ListOfFactory]
GO
ALTER TABLE [dbo].[DirectoryOfEmployees]  WITH CHECK ADD  CONSTRAINT [FK_DirectoryOfEmployees_TariffReference] FOREIGN KEY([Discharge])
REFERENCES [dbo].[TariffReference] ([Discharge])
GO
ALTER TABLE [dbo].[DirectoryOfEmployees] CHECK CONSTRAINT [FK_DirectoryOfEmployees_TariffReference]
GO
ALTER TABLE [dbo].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_DirectoryOfEmployees1] FOREIGN KEY([ServiceNumber])
REFERENCES [dbo].[DirectoryOfEmployees] ([ServiceNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_DirectoryOfEmployees1]
GO
/****** Object:  StoredProcedure [dbo].[ГлавнаяФорма]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ГлавнаяФорма]
AS
BEGIN
SET NOCOUNT ON;
SELECT   dbo.DirectoryOfEmployees.ServiceNumber, dbo.DirectoryOfEmployees.Surname, dbo.DirectoryOfEmployees.Factory, dbo.TariffReference.Discharge, dbo.TariffReference.Rate
FROM     dbo.DirectoryOfEmployees INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge
END
GO
/****** Object:  StoredProcedure [dbo].[Задание1]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание1]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        FactoryName, Surname, dbo.DirectoryOfEmployees.Discharge, Rate
FROM            dbo.DirectoryOfEmployees INNER JOIN
                         dbo.ListOfFactory ON dbo.DirectoryOfEmployees.Factory = dbo.ListOfFactory.FactoryNumber INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge
END
GO
/****** Object:  StoredProcedure [dbo].[Задание2]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание2]
@FactoryNumber int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT      @FactoryNumber as Цех, Count(ServiceNumber) as КолвоСотрудников
	FROM    DirectoryOfEmployees  
	where Factory =@FactoryNumber
END
GO
/****** Object:  StoredProcedure [dbo].[Задание2_2]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание2_2]
@ServiceNumber int,
@Factory int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Update DirectoryOfEmployees Set Factory = @Factory Where ServiceNumber = @ServiceNumber
END
GO
/****** Object:  StoredProcedure [dbo].[Задание3Измененное]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание3Измененное]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT  dbo.ReportCard.ServiceNumber, dbo.DirectoryOfEmployees.Surname, dbo.ReportCard.MonthNumber, dbo.TariffReference.Rate * 120 AS Exp1
FROM            dbo.DirectoryOfEmployees INNER JOIN
                         dbo.ReportCard ON dbo.DirectoryOfEmployees.ServiceNumber = dbo.ReportCard.ServiceNumber INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge
ORDER BY dbo.DirectoryOfEmployees.Surname
END
GO
/****** Object:  StoredProcedure [dbo].[Задание4]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание4]
@FactoryNumber int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT      FactoryNumber,  FactoryName, AVG(Rate) AS Expr1
FROM            dbo.DirectoryOfEmployees INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge INNER JOIN
                         dbo.ListOfFactory ON dbo.DirectoryOfEmployees.Factory = dbo.ListOfFactory.FactoryNumber
GROUP BY FactoryName, FactoryNumber
Having FactoryNumber = @FactoryNumber
END
GO
/****** Object:  StoredProcedure [dbo].[Задание5_]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание5_]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     ServiceNumber, Surname
     FROM           dbo.DirectoryOfEmployees INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge, (Select AVG(Rate*120) AS Expr1 from TariffReference) as Expr1
	Where Expr1  < Rate*120
END
GO
/****** Object:  StoredProcedure [dbo].[НовыйРаботник]    Script Date: 14.05.2022 10:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[НовыйРаботник]

@ServiceNumber int=0,
@Surname nvarchar(50)=0,
@Discharge int=0,
@Factory int=0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert INTO DirectoryOfEmployees(ServiceNumber, Surname, Discharge , Factory)
	values (@ServiceNumber, @Surname, @Discharge, @Factory)
    -- Insert statements for procedure here

	
END
GO
USE [master]
GO
ALTER DATABASE [Pr21] SET  READ_WRITE 
GO
