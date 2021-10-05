using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectZupree.Models
{
    public class AppUser1
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public int Gender { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ImageName { get; set; }
        public string ImageUrl { get; set; }
    }
}