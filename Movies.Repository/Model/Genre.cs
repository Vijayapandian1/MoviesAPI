using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace Movies.Repository.Model
{
    public partial class Genre
    {
        public Genre()
        {
            MoviesGenres = new HashSet<MoviesGenre>();
        }

        public int Id { get; set; }
        public string GenresName { get; set; }
        [JsonIgnore]
        public virtual ICollection<MoviesGenre> MoviesGenres { get; set; }
    }
}
