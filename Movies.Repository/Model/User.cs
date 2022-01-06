using System;
using System.Collections.Generic;

#nullable disable

namespace Movies.Repository.Model
{
    public partial class User
    {
        public User()
        {
            UserRatings = new HashSet<UserRating>();
        }

        public int Id { get; set; }
        public string UserName { get; set; }

        public virtual ICollection<UserRating> UserRatings { get; set; }
    }
}
