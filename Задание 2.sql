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
ALTER PROCEDURE [dbo].[Задание2]
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
