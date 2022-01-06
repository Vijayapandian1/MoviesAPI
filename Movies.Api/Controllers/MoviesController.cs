using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Movies.Repository.Model;
using Movies.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Movies.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MoviesController : ControllerBase
    {

        private readonly ILogger<MoviesController> _logger;
        private readonly IMovieService _movieService;
        public MoviesController(ILogger<MoviesController> logger, IMovieService movieService)
        {
            _logger = logger;
            _movieService = movieService;
        }

        [HttpGet]
        public async Task<IActionResult> Get(string title, int releaseYear, string genres)
        {
            _logger.LogInformation($"GetMovies get called with the params {title},{releaseYear},{genres}");
            if (!IsValidParams(title, releaseYear, genres))
            {
                return BadRequest("Please provide any one search criteria");
            }
            var result = await _movieService.GetMoviesAsync(title, releaseYear, genres);

            if (result.Any())
            {
                _logger.LogInformation("Successfully returned the result");
                return Ok(result);
            }

            _logger.LogInformation("Get movies has retunred no search results for the crietria");
            return NotFound("No movies found for this search criteria");

        }

        [HttpGet]
        [Route("TopRatedMovies")]
        public async Task<IActionResult> GetTopRatedMovies()
        {
            _logger.LogInformation($"GetTopRatedMovies get called");
            var result = await _movieService.GetTopRatedMoviesAsync();

            if (result.Any())
            {
                _logger.LogInformation("Success returned the results");
                return Ok(result);
            }
            _logger.LogInformation("GetTopRatedMovies has retunred no search results for this user");
            return NotFound("No movies found for this user");

        }

        [HttpGet]
        [Route("TopRatedMoviesByTheUser")]
        public async Task<IActionResult> GetTopRatedMoviesByTheUser(int userId)
        {
            _logger.LogInformation($"GetTopRatedMoviesByTheUser get called for the userId {userId}");
            var result = await _movieService.GetTopRatedMoviesForTheUserAsync(userId);
 
            if (result.Any())
            {
                _logger.LogInformation("Success returned the results");
                return Ok(result);
            }
            _logger.LogInformation("GetTopRatedMoviesByTheUser has retunred no search results for this user");
            return NotFound("No movies found for this user");

        }

        [HttpPost]
        [Route("PostRating")]
        public async Task<IActionResult> PostRating(int movieId, int userId, decimal rating)
        {
            if (userId <= 0 || movieId <= 0 || rating <= 0 || rating > 5) return BadRequest("Invalid Inputs");

            var result = await _movieService.PostRating(movieId, userId, rating);
            if (result == 1) return Ok(result);

            if (result == -10) return NotFound("UserId or MovieId not found");
            return BadRequest();

        }

        private bool IsValidParams(string title, int releaseYear, string genre)
        {
            return !(string.IsNullOrEmpty(title) && (releaseYear <= 1850 || releaseYear >= 2050) && string.IsNullOrEmpty(genre));
        }
    }
}
