Use [Pr21]
Go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Задание3]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT dbo.DirectoryOfEmployees.Surname, dbo.ReportCard.ServiceNumber, dbo.ReportCard.MonthNumber, dbo.TariffReference.Rate * 120 AS Expr1
FROM            dbo.DirectoryOfEmployees INNER JOIN
                         dbo.ReportCard ON dbo.DirectoryOfEmployees.ServiceNumber = dbo.ReportCard.ServiceNumber INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge
ORDER BY dbo.DirectoryOfEmployees.Surname
END
GO
