using Microsoft.EntityFrameworkCore;

namespace Webinversion
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }
    }
}
