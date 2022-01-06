using Movies.Repository.Context;
using Movies.Repository.Model;
using Movies.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MoviesContext _moviesContext;
        public IMovieRepository MovieRepository { get; }

        public UnitOfWork(MoviesContext moviesContext, IMovieRepository movieRepository)
        {
            this._moviesContext = moviesContext;
            this.MovieRepository = movieRepository;
        }

        public int Complete()
        {
           return _moviesContext.SaveChanges();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _moviesContext.Dispose();
            }
        }
    }
}
