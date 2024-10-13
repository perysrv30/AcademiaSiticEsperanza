using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ejercicios
{
    class Types
    {
        public static void Main2(string[] args)
        {
            string courseName = "Academia SITIC";
            String courseName2 = "Academia SITIC 2";

            int studentsCount = 28;
            bool isStaringNow = true;

            int? age = null;

            Console.WriteLine(age != null ? age : 0);

            if (age != null)
                Console.WriteLine(age);
            else
                Console.WriteLine(0);

            Console.WriteLine(age.GetValueOrDefault(0));
            Console.ReadKey();

            User user = new();
            Employer emp = new();

        }

        public class User
        {
            private int _idUser;
            private string _name;
            private string _password;

            public string Password
            {
                get => _password;
                set => _password = value;
            }
        }

        public class Person
        {
            public int PersonId { get; set; }
            public string Name { get; set; }
        }

        public class Employer : Person
        {
            public DateTime starDate { get; set; }
        }
    }
}
