using Movies.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.Repository
{
    public interface IUnitOfWork :IDisposable
    {
        IMovieRepository MovieRepository { get; }
        int Complete();
    }
}
