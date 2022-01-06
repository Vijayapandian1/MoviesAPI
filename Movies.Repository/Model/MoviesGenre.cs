using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace Movies.Repository.Model
{
    public partial class MoviesGenre
    {
        public int Id { get; set; }
        public int? MovieId { get; set; }
        public int? GenreId { get; set; }
        
        public virtual Genre Genre { get; set; }
        [JsonIgnore]
        public virtual Movie Movie { get; set; }
    }
}
