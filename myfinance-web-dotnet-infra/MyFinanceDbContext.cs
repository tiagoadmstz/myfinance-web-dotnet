using Microsoft.EntityFrameworkCore;
using myfinance_web_dotnet_domain.Entities;

namespace myfinance_web_dotnet_infra
{
    public class MyFinanceDbContext : DbContext
    {
        public DbSet<PlanoConta> PlanoConta { get; set; }

        public DbSet<Transacao> Transacao { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
          if (!optionsBuilder.IsConfigured)
          {
              optionsBuilder.UseSqlServer(@"Data Source=db,1433;Initial Catalog=myfinance;User Id=sa;Password=S3cr3t##8100;Integrated Security=false;TrustServerCertificate=true;");
          }
        }
    }
}