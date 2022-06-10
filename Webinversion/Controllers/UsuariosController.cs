using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Webinversion.Entidades;

namespace Webinversion.Controllers
{
    [ApiController]
    [Route("api/inversionista")]
    public class UsuariosController: ControllerBase
    {
        private readonly ApplicationDbContext context;

        public UsuariosController(ApplicationDbContext context)
        {
            this.context = context;
        }

        [HttpPost]

        public async Task<ActionResult<int>> Post(Usuario usuario)
        {
            var parametroID = new SqlParameter("@id", SqlDbType.Int);
            parametroID.Direction = ParameterDirection.Output;

            //Aqui llamaremos el procedimiento Almacenado 
            await context.Database.ExecuteSqlInterpolatedAsync($@"EXEC 
                                        Inversionista_Insertar
                                         @nombre={usuario.Name}, @segundo_nombre={usuario.Second_name},@apellido_p = {usuario.Last_name},@apellido_m = {usuario.Las_name_mother},@fecha_nacimiento = {usuario.Date_of_Birth}, @numero_inv = {usuario.Investor_Number}, @Curp = {usuario.CURP}, @SSN ={usuario.SSN},@Nacionalidad = {usuario.Nationality}, @id={parametroID} OUTPUT");
             var id = (int) parametroID.Value;

            return Ok(id);
                                           
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Usuario>> Get(int id)
        {
            var datonversor = context.Inversionista.FromSqlInterpolated($"EXEC Inversor_Registros @id={id}").AsAsyncEnumerable();

            await foreach (var usuario in datonversor)
            {
                return usuario;
            }

            return NotFound();
        }

        [HttpPut]
        public async Task<ActionResult<Usuario>> Put(int id, Usuario usuario)
        {
            await context.Database.ExecuteSqlInterpolatedAsync($@"EXEC 
                                        Inversor_modificar
                                         @nombre={usuario.Name}, @segundo_nombre={usuario.Second_name},@apellido_p = {usuario.Last_name},@apellido_m = {usuario.Las_name_mother},@fecha_nacimiento = {usuario.Date_of_Birth}, @numero_inv = {usuario.Investor_Number}, @Curp = {usuario.CURP}, @SSN ={usuario.SSN},@Nacionalidad = {usuario.Nationality}, @id={id}");

            return Ok("modificado");

        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult<Usuario>> Delete(int id)
        {
            var datonversor = context.Inversionista.FromSqlInterpolated($"EXEC EliminarRegistros @id={id}").AsAsyncEnumerable();


            return NoContent();

        }

        [HttpPost("beneficiario/{id_inv:int}/{porcentaje:int}")]
        public async Task<ActionResult<Usuario>> PostBeneficiario(int id_inv, int porcentaje, Usuario usuario)
        {

          
            var datonversor = context.Inversionista.FromSqlInterpolated($"EXEC Benifesario_Insertar @id_inv={id_inv}, @porcentaje = {porcentaje}, @nombre={usuario.Name}, @segundo_nombre={usuario.Second_name},@apellido_p = {usuario.Last_name},@apellido_m = {usuario.Las_name_mother},@fecha_nacimiento = {usuario.Date_of_Birth}, @Curp = {usuario.CURP}, @SSN ={usuario.SSN},@Nacionalidad = {usuario.Nationality}, @id").AsAsyncEnumerable();

           

            return Ok(datonversor);
        }
    }
}
