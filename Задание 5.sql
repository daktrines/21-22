USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[???????5]    Script Date: 14.05.2022 7:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[???????5_]
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
