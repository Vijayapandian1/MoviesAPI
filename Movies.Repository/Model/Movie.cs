using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

#nullable disable

namespace Movies.Repository.Model
{
    public partial class Movie
    {
        public Movie()
        {
            MoviesGenres = new HashSet<MoviesGenre>();
            UserRatings = new HashSet<UserRating>();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        [JsonPropertyName("yearOfRelease")]
        public int? ReleaseYear { get; set; }
        public int? RunningTime { get; set; }
        [NotMapped]
        public string AverageRating { get; set; }
        [NotMapped]
        public IEnumerable<string> Genres { get; set; }
        [JsonIgnore]
        public virtual ICollection<MoviesGenre> MoviesGenres { get; set; }
        [JsonIgnore]
        public virtual ICollection<UserRating> UserRatings { get; set; }
    }
}
