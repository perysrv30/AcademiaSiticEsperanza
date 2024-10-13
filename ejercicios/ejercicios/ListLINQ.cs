using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ejercicios
{
    class ListLINQ
    {
        #region Classes
        public class People
        {
            #region Propierties
            public string Name { get; set; }
            public int Age { get; set; }
            public eGender Gender { get; set; }

            #endregion
            #region Constuctor
            public People() { }

            public People(string name, int age, eGender gander)
            {
                Name = name;
                Age = age;
                Gender = gander;
            }

            #endregion
            #region Methods

            public override string ToString()
            {
                return $"Nombre: {Name}, Edad: {Age}, Genero";
            }

            private string GetStringGender(eGender gender)
            {
                string genderString;
                #region if
                //if (gender == eGender.Undefined)
                //    genderString = "Indefinido";
                //else if (gender == eGender.Female)
                //    genderString = "Femenino";
                //else if (gender == eGender.Male)
                //    genderString = "Masculino"; 
                //else
                //    genderString = "No válido";
                #endregion

                #region Switch
                //switch (gender)
                //{
                //    case eGender.Undefined:
                //        genderString = "Indefinido";
                //        break;
                //    case eGender.Female:
                //        genderString = "Femenino";
                //        break;
                //    case eGender.Male:
                //        genderString = "Masculino";
                //        break;
                //    default:
                //        genderString = "No válido";
                //        break;
                //} 
                #endregion

                #region Switch Lamba
                genderString = gender switch
                {
                    eGender.Undefined => "Indefinido",
                    eGender.Male => "Masculino",
                    eGender.Female => "Femenino",
                    _ => "No valido"

                };
                #endregion

                return genderString;
            }

            #endregion
        }
        #endregion
        #region Enums
        public enum eGender
        {
            Undefined,
            Female,
            Male
        }
        #endregion
        public static void Main2(string[] args)
        {

            List<People> employeers = new()
            {
                new People
                {
                    Name = "Maria",
                    Age = 18,
                    Gender = eGender.Female

                },

                new People
                {
                    Name = "Andrea",
                    Age = 25,
                    Gender = eGender.Female
                }
            };

            if (employeers != null)
            {
                employeers.Add(new("Ricardo", 34, eGender.Male));
                employeers.Add(new("Jazmin", 33, eGender.Female));
                employeers.Add(new("Vicente", 28, eGender.Male));
                employeers.Add(new("Abraham", 42, eGender.Male));
                employeers.Add(new("Alberto", 20, eGender.Male));
            }

            List<People> students = new()
            {
                new("Iris", 23, eGender.Female),
                new("Jesús", 26, eGender.Male),
                new("Andrés", 33, eGender.Male),
                new("América", 22, eGender.Female),
                new("Paola", 22, eGender.Female),
                new("Christian", 22, eGender.Male),
            };

            #region Where
            //Ejemplo 1: Filtrar Nombres de empleados que comiencen con la la letra 'A'
            Console.WriteLine("\n Where - Filtrar nombres que comiencen con la letra 'A'");
            List<People> filteredEmployeers = employeers.Where(employeer => employeer.Name.StartsWith('A')).ToList();
            WriteLine(filteredEmployeers);

            Console.WriteLine("\n Where - Filtrat empleados mayores a 30 años");
            filteredEmployeers = employeers.Where(employeer => employeer.Age > 30).ToList();
            WriteLine(filteredEmployeers);
            #endregion

            #region Select
            Console.WriteLine("\n Select - Tomar el nombre  (seleccionar una propiedad en especifico)");
            List<string> filteredEmployeersNames = employeers.Select(employeer => employeer.Name).ToList();
            foreach (string name in filteredEmployeersNames)
            {
                Console.WriteLine(name);
            }
            #endregion

            #region OrderBy o OrderByDescending
            Console.WriteLine("\n OrderBy- Ordenamiento por nombre vs la diferencia de la lista original");
            List<People> filteredStudents = students.OrderBy(student => student.Name).ToList();
            int i = 0;
            People originalStudent = null;
            foreach (var filteredStudent in filteredStudents)
            {
                originalStudent = students[i];
                Console.WriteLine($"{filteredStudent.Name}-{originalStudent.Name}");
                i++;
            }

            Console.WriteLine("\n OrderByDescending - Ordenar por edad y diefrencia con la lista original ");
            filteredStudents = students.OrderByDescending(student => student.Age).ToList();
            i = 0;
            originalStudent = null;
            foreach (var filteredStudent in filteredStudents)
            {
                originalStudent = students[i];
                Console.WriteLine($"{filteredStudent.Name}-{originalStudent.Name}");
                i++;
            }

            #endregion

            #region GroupBy
            Console.WriteLine("\nGROUPBY - Agrupamiento por género");
            var groupedByGender = students.GroupBy(student => student.Gender);
            foreach (var group in groupedByGender)
            {
                Console.WriteLine($"Género (grupo): {group.Key}");
                foreach (var person in group)
                {
                    Console.WriteLine($"{person.Name}");
                }
            }

            Console.WriteLine("\n GroupBy - Agrupamiento por edades");
            var groupedByAge = students.GroupBy(student => student.Age);
            foreach (var group in groupedByAge)
            {
                Console.WriteLine($"Edades (grupo): {group.Key} - Total: {group.Count()}");
                foreach (var person in group)
                {
                    Console.WriteLine($"{person.Name}");
                }

            }
            #endregion

            #region ANY

            Console.WriteLine("\n Any - Verificar si hay valores o no dentro de una lista");
            Console.WriteLine($"Existen valores en 'employeers: {employeers.Any()}");
            Console.WriteLine($"Existen empleados mayores de 30: {employeers.Any(employeer => employeer.Age > 30)}");

            #endregion

            Console.ReadKey();

        }

        private static void WriteLine(List<People> peopleList)
        {
            foreach (People people in peopleList)
            {
                Console.WriteLine(people.ToString());
            }
        }
    }
}
