using Microsoft.EntityFrameworkCore;

namespace ExcelToDB.Models
{
    public class DoorBuilderDBContext : DbContext
    {
        public DbSet<DoorBuilderDetails> DoorBuilderDetails { get; set; }

        public DoorBuilderDBContext(DbContextOptions<DoorBuilderDBContext> options) : base(options)
        {
            
        }

    }
}
