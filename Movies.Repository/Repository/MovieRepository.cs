using Movies.Repository.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Movies.Repository.Context;

namespace Movies.Repository.Repository
{
    public class MovieRepository : Repository<Movie>, IMovieRepository, IDisposable
    {
        public readonly MoviesContext _moviesContext;
        public MovieRepository(MoviesContext moviesContext) : base(moviesContext)
        {
            _moviesContext = moviesContext;
        }

        public async Task<IEnumerable<Movie>> GetMovies(string titleSearch, int releaseYear, string genres)
        {
            IList<string> genreList = genres?.Split(",")?.ToList();
            return await _moviesContext.Movies.Include(i => i.MoviesGenres).ThenInclude(j => j.Genre).
            Where(
                    i => (
                        i.Title.Contains(titleSearch) ||
                        i.ReleaseYear == releaseYear ||
                        (!string.IsNullOrEmpty(genres) && i.MoviesGenres.Any(a => genreList.Contains(a.Genre.GenresName)))
                    )
                )
            .Include(i => i.UserRatings).Select(g => GetAverageAndGenres(g)).AsSplitQuery().AsNoTracking().ToListAsync();
        }

        public async Task<IEnumerable<Movie>> GetTopRatedMovies()
        {

            var result = await _moviesContext.Movies.Include(i => i.MoviesGenres).ThenInclude(j => j.Genre)
                .Include(i => i.UserRatings)
                .Select(g => GetAverageAndGenres(g)).AsSplitQuery().AsNoTracking()
               .ToListAsync();
            return result.OrderByDescending(i => i.AverageRating).Take(5);
        }

        public async Task<IEnumerable<Movie>> GetTopRatedMoviesForTheUser(int userId)
        {
            var result = await _moviesContext.Movies.Include(i => i.MoviesGenres).ThenInclude(j => j.Genre)
               .Include(i => i.UserRatings).Where(m => m.UserRatings.Select(u => u.UserId).Contains(userId))
               .Select(g => GetRatingAddGenreForTheUser(g)).AsSplitQuery().AsNoTracking()
              .ToListAsync();
            return result.OrderByDescending(i => i.AverageRating).Take(5); ;
        }

        public async Task<int> PostRating(int movieId, int userId, decimal rating)
        {
            if (!_moviesContext.Movies.Where(m => m.Id == movieId).Any()) return -10;
            if (!_moviesContext.Users.Where(m => m.Id == userId).Any()) return -10;
            var data = await _moviesContext.UserRatings.Where(u => u.MovieId == movieId && u.UserId == userId).FirstOrDefaultAsync();
            if (data != null)
            {
                data.Rating = Math.Round(rating, 2);
                _moviesContext.Entry(data).CurrentValues.SetValues(data);
            }
            else
            {
                UserRating userRating = new UserRating() { MovieId = movieId, UserId = userId, Rating = Math.Round(rating, 2) };
                _moviesContext.UserRatings.Add(userRating);
            }
            return await _moviesContext.SaveChangesAsync(); ;
        }

        private static Movie GetAverageAndGenres(Movie movie)
        {
            decimal averageRating = movie.UserRatings?.Select(i => i.Rating).Average() ?? 0;
            movie.AverageRating = string.Format("{0:0.0}", Math.Round(averageRating * 2, MidpointRounding.AwayFromZero) / 2);
            movie.Genres = movie.MoviesGenres.Select(i => i.Genre.GenresName);
            return movie;
        }

        private static Movie GetRatingAddGenreForTheUser(Movie movie)
        {
            decimal userRating = movie.UserRatings?.Select(i => i.Rating).FirstOrDefault() ?? 0;
            movie.AverageRating = string.Format("{0:0.0}", userRating);
            movie.Genres = movie.MoviesGenres.Select(i => i.Genre.GenresName);
            return movie;
        }

        public void Dispose()
        {
            _moviesContext.Dispose();
        }
    }
}
