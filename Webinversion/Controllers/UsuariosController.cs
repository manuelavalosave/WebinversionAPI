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
            var datonversor = await context.Database.ExecuteSqlInterpolatedAsync($"EXEC EliminarRegistros @id={id}");


            return NoContent();

        }

        [HttpPost("beneficiario/{id_inv:int}/{porcentaje:int}")]
        public async Task<ActionResult<Usuario>> PostBeneficiario(int id_inv, int porcentaje, Usuario usuario)
        {

            var datonversor = context.Inversionista.FromSqlInterpolated($"EXEC Inversor_Registros @id={id_inv}").AsAsyncEnumerable();

            await foreach (var usuario2 in datonversor)
            {
                var demo = await context.Database.ExecuteSqlInterpolatedAsync($"EXEC Benifesario_Insertar @id_inv={id_inv}, @porcentaje = {porcentaje}, @nombre={usuario.Name}, @segundo_nombre={usuario.Second_name},@apellido_p = {usuario.Last_name},@apellido_m = {usuario.Las_name_mother},@fecha_nacimiento = {usuario.Date_of_Birth}, @Curp = {usuario.CURP}, @SSN ={usuario.SSN},@Nacionalidad = {usuario.Nationality}, @id=1");



                return Ok("datos insertados");
            }

            return NotFound();
           

            

            
        }

        [HttpPut("beneficiario/{id_inv:int}/{id_benifi:int}")]
        public async Task<ActionResult<Usuario>> PutBeneficiario(int id_inv,int id_benifi, int porcentaje_u, Usuario usuario)
        {
           var editarA = await context.Database.ExecuteSqlInterpolatedAsync($@"EXEC 
                                        Inversor_modificar
                                         @nombre={usuario.Name}, @segundo_nombre={usuario.Second_name},@apellido_p = {usuario.Last_name},@apellido_m = {usuario.Las_name_mother},@fecha_nacimiento = {usuario.Date_of_Birth}, @numero_inv = {usuario.Investor_Number}, @Curp = {usuario.CURP}, @SSN ={usuario.SSN},@Nacionalidad = {usuario.Nationality}, @id={id_benifi}");

            var porcentaje = await context.Database.ExecuteSqlInterpolatedAsync($@"EXEC 
                                        Beneficiario_modificar_porcentaje
                                         @id_beni={id_benifi}, @porcentaje_act={porcentaje_u}");

            return Ok("modificado");

        }

        [HttpDelete("beneficiario/{id_inv:int}/{id_benifi:int}/")]
        public async Task<ActionResult<Usuario>> Delete(int id_inv, int id_benifi)
        {
            var eliminarDatosBeni = await context.Database.ExecuteSqlInterpolatedAsync($"EXEC Beneficiario_elminar @id_TABLA_benif={id_benifi}");
            var datonversor = await context.Database.ExecuteSqlInterpolatedAsync($"EXEC EliminarRegistros @id={id_benifi}");

            return NoContent();

        }
    }
}
