
using System;
using System.ComponentModel.DataAnnotations;

namespace Webinversion.Entidades
{
    public class Usuario
    {
        [Key]
        public int id { get; set; }
        public string Name { get; set; }

        public string Second_name { get; set; }

        public string Last_name { get; set; }

        public string Las_name_mother { get; set; }

        public DateTime Date_of_Birth { get; set; }

        public int Investor_Number { get; set; }

        public string CURP { get; set; }
        public string SSN { get; set; }

        public string Nationality { get; set; }

        


    }
}
