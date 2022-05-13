USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[ГородОтправления]    Script Date: 07.05.2022 16:06:13 ******/
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
