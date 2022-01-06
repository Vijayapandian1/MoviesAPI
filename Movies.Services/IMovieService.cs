using Movies.Repository.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.Services
{
    public interface IMovieService
    {
        public Task<IEnumerable<Movie>> GetMoviesAsync(string titleSearch, int releaseYear, string genre);
        public Task<IEnumerable<Movie>> GetTopRatedMoviesAsync();
        public Task<IEnumerable<Movie>> GetTopRatedMoviesForTheUserAsync(int userId);

        public Task<int> PostRating(int movieId,int userId, decimal rating);
    }
}
