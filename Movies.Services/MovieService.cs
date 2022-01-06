using Microsoft.Extensions.Configuration;
using Movies.Repository;
using Movies.Repository.Model;
using Movies.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Movies.Services
{
    public class MovieService : IMovieService
    {
        private readonly IUnitOfWork _unitOfWork;
        public MovieService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<IEnumerable<Movie>> GetMoviesAsync(string titleSearch, int releaseYear, string genre)
        {
            if (string.IsNullOrEmpty(titleSearch) && (releaseYear <= 1850 || releaseYear >= 2050) && string.IsNullOrEmpty(genre))
                throw new ArgumentException("Invalid Search Criteria");
            var movies = await _unitOfWork.MovieRepository.GetMovies(titleSearch, releaseYear, genre);
            return movies;

        }
        public async Task<IEnumerable<Movie>> GetTopRatedMoviesAsync()
        {
            var movies = await _unitOfWork.MovieRepository.GetTopRatedMovies();
            return movies;
        }
        public async Task<IEnumerable<Movie>> GetTopRatedMoviesForTheUserAsync(int userId)
        {
            if (userId <= 0)
                throw new ArgumentException("Invalid Search Criteria");
            var movies = await _unitOfWork.MovieRepository.GetTopRatedMoviesForTheUser(userId);
            return movies;
        }
        public async Task<int> PostRating(int movieId, int userId, decimal rating)
        {
            var result = await _unitOfWork.MovieRepository.PostRating(movieId, userId, rating);
            return result;
        }
    }
}
