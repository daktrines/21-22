USE [Pr21]
GO
/****** Object:  StoredProcedure [dbo].[НовыйРаботник]    Script Date: 13.05.2022 8:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[НовыйРаботник]

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
