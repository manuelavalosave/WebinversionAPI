using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Webinversion.Migrations
{
    public partial class ProcedimientoAlmacenado : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            //creamos los procedimientos almacenados, para insertar

            migrationBuilder.Sql(@"
                            CREATE PROCEDURE dbo.Inversionista_Insertar
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
                                ");

            //creamos el procedimiento de almacenado para mostrar
            migrationBuilder.Sql(@"CREATE PROCEDURE dbo.TodoslosRegistros
                                    AS BEGIN 
                                    SELECT * FROM Inversionista 
                                END");

            //creamos el procedimiento de almacenado para modificar datos 
            migrationBuilder.Sql(@"CREATE PROCEDURE dbo.Inversor_modificar
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
							     END");

            //creamos el procedimiento de almacenado para mostrar
            migrationBuilder.Sql(@"CREATE PROCEDURE dbo.TodoslosRegistros
                                    @id int
                                    AS BEGIN 
                                    SELECT * FROM Inversionista Where id = @id
                                END");
            //creamos el procedimiento de almacenado para eliminar
            migrationBuilder.Sql(@"CREATE PROCEDURE dbo.EliminarRegistros
									@id int
                                    AS BEGIN 
                                    DELETE FROM Inversionista WHERE id = @id
                                END");

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
           
        }
    }
}
