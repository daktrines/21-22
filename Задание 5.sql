USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[Задание5]    Script Date: 13.05.2022 17:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Задание5]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT      Surname
     FROM           dbo.DirectoryOfEmployees INNER JOIN
                         dbo.TariffReference ON dbo.DirectoryOfEmployees.Discharge = dbo.TariffReference.Discharge, (Select AVG(Rate*120) AS Expr1 from TariffReference) as Expr1
	Where Expr1  < Rate*120

END
