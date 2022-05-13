USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[Задание3]    Script Date: 13.05.2022 13:22:48 ******/
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
