-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Crear un ticket>
-- =============================================
CREATE PROCEDURE sp_insert_ticket
	-- Add the parameters for the stored procedure here
	 @description int, @idCostumer int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

INSERT INTO [dbo].[Ticket]
           ([description]
           ,[state]
           ,[hour]           
           ,[idCostumer])
     VALUES
           (@description,'Started', GETDATE() , @idCostumer);
END
GO

-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket_id
@idCode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
  where Ticket.idCode=@idCode
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket_costumer
@idCostumer int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
  where Ticket.idCostumer=@idCostumer
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket_cordinator
@idCordinator int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
  where Ticket.idCordinator=@idCordinator
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket_funtionary
@idfuntionary int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
  where Ticket.idEmployee=@idfuntionary
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_listar_ticket_category
@idcategory int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [idCode]
      ,[description]
      ,[state]
      ,[hour]
      ,[idCategory]
      ,[idCostumer]
      ,[idCordinator]
      ,[idEmployee]
  FROM [dbo].[Ticket]
  where Ticket.idCategory=@idcategory
END
GO
-- =============================================
-- Author:		<ALlberth Calderon>
-- Create date: <Create Date 20190206>
-- Description:	<Description Listar un ticket>
-- =============================================
CREATE PROCEDURE sp_funtionary_asigned 
	-- Add the parameters for the stored procedure here
	@idCode int, @idFuntionary int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[Ticket]
   SET 
      [idEmployee] = @idFuntionary
 WHERE  [idCode] = @idCode


end
GO

