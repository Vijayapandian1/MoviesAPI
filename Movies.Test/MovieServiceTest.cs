using Moq;
using Movies.Repository;
using Movies.Repository.Model;
using Movies.Repository.Repository;
using Movies.Services;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Movies.Test
{
    [TestFixture]
    public class MovieServiceTest
    {
        private IUnitOfWork _mockUnitOfWork;
        private Mock<IMovieRepository> _mockMovieRepository;
        public MovieServiceTest()
        {
            _mockMovieRepository = new Mock<IMovieRepository>();
            _mockUnitOfWork = new UnitOfWork(null, _mockMovieRepository.Object);

        }

        [Test]
        public async Task GetMoviesAsync_ReturnMovies_WhenValidInputs()
        {
            //Arrange
            string titleSearch = "Test";
            _mockMovieRepository.Setup(i => i.GetMovies(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<string>())).ReturnsAsync(new List<Movie> { new Movie { Id = 1, Title = "TestTitle", AverageRating = "4.0", ReleaseYear = 1995 } });

            //Act            
            var sut = new MovieService(_mockUnitOfWork);
            IEnumerable<Movie> actual = await sut.GetMoviesAsync(titleSearch, 0, null);

            //Assert
            Assert.IsNotNull(actual);
            Assert.AreEqual("TestTitle", actual.FirstOrDefault().Title);
        }

        [Test]
        public void GetMoviesAsync_ThrowException_WhenInValidInputs()
        {
            //Arrange
            string titleSearch = ""; int releaseYear = 1000; string genres = "";
            _mockMovieRepository.Setup(i => i.GetMovies(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<string>())).ReturnsAsync(new List<Movie> { new Movie { Id = 1, Title = "TestTitle", AverageRating = "4.0", ReleaseYear = 1995 } });

            //Act            
            var sut = new MovieService(_mockUnitOfWork);

            //Assert
            Assert.ThrowsAsync<ArgumentException>(() => sut.GetMoviesAsync(titleSearch, releaseYear, genres));
        }

        [Test]
        public async Task GetTopRatedMoviesAsync_ReturnMovies_WhenMoviesAreAvailable()
        {
            //Arrange
            _mockMovieRepository.Setup(i => i.GetTopRatedMovies()).ReturnsAsync(new List<Movie> { new Movie { Id = 1, Title = "TestTitle", AverageRating = "4.0", ReleaseYear = 1995 }, new Movie { Id = 2, Title = "TestTitle2", AverageRating = "3.5", ReleaseYear = 2015 } });

            //Act            
            var sut = new MovieService(_mockUnitOfWork);
            IEnumerable<Movie> actual = await sut.GetTopRatedMoviesAsync();

            //Assert
            Assert.IsNotNull(actual);
            Assert.AreEqual("TestTitle", actual.FirstOrDefault().Title);
        }

        [Test]
        public async Task GetTopRatedMoviesForTheUserAsync_ReturnMovies_WhenValidUserId()
        {
            //Arrange
            int userId = 1;
            _mockMovieRepository.Setup(i => i.GetTopRatedMoviesForTheUser(It.IsAny<int>())).ReturnsAsync(new List<Movie> { new Movie { Id = 1, Title = "TestTitle", AverageRating = "4.0", ReleaseYear = 1995 }, new Movie { Id = 2, Title = "TestTitle2", AverageRating = "3.5", ReleaseYear = 2015 } });

            //Act            
            var sut = new MovieService(_mockUnitOfWork);
            IEnumerable<Movie> actual = await sut.GetTopRatedMoviesForTheUserAsync(userId);

            //Assert
            Assert.IsNotNull(actual);
            Assert.AreEqual("TestTitle", actual.FirstOrDefault().Title);
        }

        [Test]
        public void GetTopRatedMoviesForTheUserAsync_ThrowException_WhenInValidUserId()
        {
            //Arrange
            int userId = -1;
            _mockMovieRepository.Setup(i => i.GetMovies(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<string>())).ReturnsAsync(new List<Movie> { new Movie { Id = 1, Title = "TestTitle", AverageRating = "4.0", ReleaseYear = 1995 } });

            //Act            
            var sut = new MovieService(_mockUnitOfWork);

            //Assert
            Assert.ThrowsAsync<ArgumentException>(() => sut.GetTopRatedMoviesForTheUserAsync(userId));
        }
    }
}
