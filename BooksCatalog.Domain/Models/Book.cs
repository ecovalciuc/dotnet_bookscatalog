using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BooksCatalog.Domain.Models
{
    public class Book
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(30)]
        public string Name { get; set; }

        [StringLength(500)]
        public string ImageUrl { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        [DataType(DataType.Date)]
        public DateTime PublishDate { get; set; }

        public Author Author { get; set; }

        public DbSet<BookCategory> BookCategories { get; set; }

        public DbSet<LocationBook> LocationBooks { get; set; }
    }
}
