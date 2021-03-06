USE [SIGMA]
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 11/12/2020 2:31:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JUAN DIEGO OSORIO CASTRILLÓN
-- Create date: 11/11/2020 
-- =============================================

ALTER PROCEDURE [dbo].[createUser]
	@departament VARCHAR(60),
	@city VARCHAR(60),
	@name VARCHAR(60),
	@email VARCHAR(60),
	@new_identity INT = NULL OUTPUT

AS
BEGIN
 
	INSERT INTO 
		[dbo].[users] ([departament],[city], [name], [email]) 
	 
	VALUES
		(@departament, @city, @name, @email);

	SELECT @new_identity = SCOPE_IDENTITY()

    SELECT @new_identity AS id

    RETURN
	
END
