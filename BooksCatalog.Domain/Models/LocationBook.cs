using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BooksCatalog.Domain.Models
{
    public class LocationBook
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public Book Book { get; set; }

        public Location Location { get; set; }
    }
}
