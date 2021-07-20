using BooksCatalog.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BooksCatalog.Repositories
{
    public interface ICategoryRepository
    {
        Task<List<Category>> GetCategoriesListAsync();
    }
}
