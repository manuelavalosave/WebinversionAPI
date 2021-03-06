USE [master]
GO
/****** Object:  Database [Inversiones_db]    Script Date: 6/14/2022 4:06:44 PM ******/
CREATE DATABASE [Inversiones_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inversiones_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inversiones_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inversiones_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inversiones_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Inversiones_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inversiones_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inversiones_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inversiones_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inversiones_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inversiones_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inversiones_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inversiones_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inversiones_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inversiones_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inversiones_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inversiones_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inversiones_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inversiones_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inversiones_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inversiones_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inversiones_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inversiones_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inversiones_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inversiones_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inversiones_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inversiones_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inversiones_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inversiones_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inversiones_db] SET RECOVERY FULL 
GO
ALTER DATABASE [Inversiones_db] SET  MULTI_USER 
GO
ALTER DATABASE [Inversiones_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inversiones_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inversiones_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inversiones_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inversiones_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inversiones_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inversiones_db', N'ON'
GO
ALTER DATABASE [Inversiones_db] SET QUERY_STORE = OFF
GO
USE [Inversiones_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Id_inv] [int] NOT NULL,
	[Id_Benfi] [int] NOT NULL,
	[Porcentaje] [float] NULL,
 CONSTRAINT [PK_Beneficiario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inversionista]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inversionista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[Second_name] [varchar](20) NULL,
	[Last_name] [varchar](20) NOT NULL,
	[Las_name_mother] [varchar](20) NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Investor_Number] [int] NULL,
	[CURP] [varchar](18) NOT NULL,
	[SSN] [varchar](11) NOT NULL,
	[Nationality] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Inversionista] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Beneficiario_elminar]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Beneficiario_elminar]
							
                           @id_TABLA_benif int
						  
                            As
                            BEGIN SET NOCOUNT ON;
							DELETE FROM Beneficiario WHERE Id_Benfi = @id_TABLA_benif
                              DELETE FROM Inversionista WHERE id = @id_TABLA_benif
							  
         END
GO
/****** Object:  StoredProcedure [dbo].[Beneficiario_modificar_porcentaje]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Beneficiario_modificar_porcentaje]
							
                           @id_beni int,
						   @porcentaje_act int
                            As
                            BEGIN SET NOCOUNT ON;
                            UPDATE Beneficiario
							 SET
							 Porcentaje = @porcentaje_act
							 WHERE Id_Benfi = @id_beni;
							     END
GO
/****** Object:  StoredProcedure [dbo].[Benifesario_Insertar]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Benifesario_Insertar]
                            @nombre varchar(max),
                            @segundo_nombre varchar(max),
                            @apellido_p varchar(max),
                            @apellido_m varchar(max),
                            @fecha_nacimiento date,
                            @Curp varchar(max),
                            @SSN varchar(max),
                            @Nacionalidad varchar(max),
                            @id int,
							@id_inv int,
							@porcentaje int
                            As
                            BEGIN SET NOCOUNT ON;
                            
                            INSERT INTO Inversionista(Name,Second_name,Last_name,Las_name_mother,Date_of_Birth,CURP,SSN,Nationality)
                             VALUES(@nombre,@segundo_nombre,@apellido_p,@apellido_m,@fecha_nacimiento,@Curp,@SSN,@Nacionalidad)
                                
                              SELECT @id = SCOPE_IDENTITY()
						   INSERT INTO Beneficiario (Id_inv,Id_Benfi,Porcentaje)
						    VALUES (@id_inv,@id,@porcentaje)


                               END
GO
/****** Object:  StoredProcedure [dbo].[EliminarRegistros]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarRegistros]
									@id int
                                    AS BEGIN 
                                    DELETE FROM Inversionista WHERE id = @id
                                END
GO
/****** Object:  StoredProcedure [dbo].[Inversionista_Insertar]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                            CREATE PROCEDURE [dbo].[Inversionista_Insertar]
                            @nombre varchar(max),
                            @segundo_nombre varchar(max),
                            @apellido_p varchar(max),
                            @apellido_m varchar(max),
                            @fecha_nacimiento date,
                            @numero_inv int,
                            @Curp varchar(max),
                            @SSN varchar(max),
                            @Nacionalidad varchar(max),
                            @id int OUTPUT
                            As
                            BEGIN SET NOCOUNT ON;
                            
                            INSERT INTO Inversionista(Name,Second_name,Last_name,Las_name_mother,Date_of_Birth,Investor_Number,CURP,SSN,Nationality)
                             VALUES(@nombre,@segundo_nombre,@apellido_p,@apellido_m,@fecha_nacimiento,
@numero_inv,@Curp,@SSN,@Nacionalidad)
                                
                              SELECT @id = SCOPE_IDENTITY()
                               END
                                
GO
/****** Object:  StoredProcedure [dbo].[Inversor_modificar]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inversor_modificar]
							 @nombre varchar(max),
                            @segundo_nombre varchar(max),
                            @apellido_p varchar(max),
                            @apellido_m varchar(max),
                            @fecha_nacimiento date,
                            @numero_inv int,
                            @Curp varchar(max),
                            @SSN varchar(max),
                            @Nacionalidad varchar(max),
                           @id int
                            As
                            BEGIN SET NOCOUNT ON;
                            UPDATE Inversionista
							 SET
							 Name = @nombre,
							 Second_name = @segundo_nombre,
							 Last_name = @apellido_p,
							 Las_name_mother = @apellido_m,
							 Date_of_Birth = @fecha_nacimiento,
							 Investor_Number = @numero_inv,
							 CURP = @Curp,
							 SSN = @SSN,
							 Nationality = @Nacionalidad
							 WHERE id = @id
							 end
GO
/****** Object:  StoredProcedure [dbo].[Inversor_Registros]    Script Date: 6/14/2022 4:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Inversor_Registros]
                                    @id int
                                    AS BEGIN 
                                    SELECT * FROM Inversionista WHERE  id = @id; 
                                END
GO
USE [master]
GO
ALTER DATABASE [Inversiones_db] SET  READ_WRITE 
GO
