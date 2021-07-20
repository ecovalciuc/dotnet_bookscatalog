using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BooksCatalog.Domain.Models
{
    public class Location
    {
        [Key, Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        
        [StringLength(30)]
        public string Name { get; set; }

        [StringLength(20)]
        public string Country { get; set; }

        [StringLength(20)]
        public string City { get; set; }

        [StringLength(60)]
        public string Address { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }

        [StringLength(40)]
        public string Email { get; set; }
    }
}
