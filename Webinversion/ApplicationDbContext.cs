using Microsoft.EntityFrameworkCore;
using Webinversion.Entidades;

namespace Webinversion
{
    public class ApplicationDbContext : DbContext   
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Usuario> Inversionista { get; set; }
    }
}


