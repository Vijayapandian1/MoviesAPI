using Movies.Repository.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.Repository.Repository
{
    public interface IMovieRepository : IRepository<Movie>
    {
        Task<IEnumerable<Movie>> GetMovies(string titleSearch, int releaseYear, string genre);
        Task<IEnumerable<Movie>> GetTopRatedMovies();
        Task<IEnumerable<Movie>> GetTopRatedMoviesForTheUser(int userId);
        Task<int> PostRating(int movieId, int userId, decimal rating);
    }
}
