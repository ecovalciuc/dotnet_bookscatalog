using BooksCatalog.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BooksCatalog.Repositories
{
    public interface IBookRepository
    {
        Task<List<Book>> GetBooksListAsync();
        
        Task<List<Book>> GetBooksListByCategoryAsync(int categoryId);
    }
}
