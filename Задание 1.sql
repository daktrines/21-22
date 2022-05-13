USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[Задание3]    Script Date: 13.05.2022 18:24:42 ******/
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
