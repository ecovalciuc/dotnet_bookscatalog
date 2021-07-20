using BooksCatalog.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace BooksCatalog.Domain
{
    public class BooksCatalogDbContext: DbContext
    {
        public BooksCatalogDbContext(DbContextOptions options):base(options) { }

        public DbSet<Author> Authors { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<BookCategory> BookCategories { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<LocationBook> LocationBooks { get; set; }
    }
}
