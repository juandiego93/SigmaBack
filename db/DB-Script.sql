USE [SIGMA]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/12/2020 2:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departament] [varchar](55) NOT NULL,
	[city] [varchar](55) NOT NULL,
	[name] [varchar](55) NOT NULL,
	[email] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 11/12/2020 2:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JUAN DIEGO OSORIO CASTRILLÓN
-- Create date: 11/11/2020 
-- =============================================

CREATE PROCEDURE [dbo].[createUser]
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
GO
