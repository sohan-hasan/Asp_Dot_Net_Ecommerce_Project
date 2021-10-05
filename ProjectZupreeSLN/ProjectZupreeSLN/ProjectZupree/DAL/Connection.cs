using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ProjectZupree.DAL
{
    public static class Connection
    {
        public static string GetConnectionString()
        {
            string conStr = ConfigurationManager.ConnectionStrings["ZupreeDB"].ConnectionString;
            return conStr;
        }
    }
}