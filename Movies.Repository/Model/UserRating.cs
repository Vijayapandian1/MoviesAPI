using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace Movies.Repository.Model
{
    public partial class UserRating
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public int? MovieId { get; set; }
        public decimal? Rating { get; set; }
        [JsonIgnore]
        public virtual Movie Movie { get; set; }
        [JsonIgnore]
        public virtual User User { get; set; }
    }
}
