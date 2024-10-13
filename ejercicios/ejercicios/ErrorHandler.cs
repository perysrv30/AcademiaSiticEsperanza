using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ejercicios
{
    class ErrorHandler
    {
        #region Propierties
        private static List<User> UserList { get; set; } = GetUsers();
        #endregion

        #region Variables
        private const int MIN_AGE = 10;
        private const int MAX_AGE = 100;

        #endregion

        #region Classes

        public class User
        {
            #region Propierties
            public int UserId { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }

            #endregion

            #region Constructors

            public User() { }

            public User(int userId, string userName, string password)
            {
                UserId = userId;
                Username = userName;
                Password = password;
            }

            public User(string userName, string password)
            {
                Username = userName;
                Password = password;
            }

            #endregion

        }

        #region ErrorPropio

        public class CustomAppException : Exception
        {
            private eErrorTipo errorResponseEx { get; set; } = eErrorTipo.Ninguno;

            public CustomAppException(): base() { }

            public CustomAppException(string message, eErrorTipo type) : base(message)
            {
                errorResponseEx = type;
            }
        }

        public enum eErrorTipo
        {
            Ninguno = 0,
            Validacion, 
            Conexion, 
            InformacionDuplicada, 
            Autenticacion, 
            Desconocido = 99
        }

        #endregion

        #endregion

        private static List<User> GetUsers()
        {
            return new()
            {
                new(1, "admin", "admin"),
                new(2, "sa", "12345"),
                new(3, "johndoe", "contrasena"),
                new(4, "miguel94", "19940707")
            };
        }

        public static void Main2(string[] args)
        {
            const string username = "Tamaris";
            const string password = "admin";

            //RegistrerUserWithoutValidations(username, password, "catorce"); error
            //RegistrerUserWithoutValidations(username, password, "14");

            RegistrerUserWithValidations(username, password, "catorce"); // catch error
            RegistrerUserWithValidations(username, password, "14");


            Console.ReadKey();
        }

        public static int RegistrerUserWithoutValidations(string username, string password, string ageInput)
        {
            int userId, age;
            Console.WriteLine("Conexion a la base de datos");
            Console.WriteLine("Abrimos Transacción");

            age = Convert.ToInt32(ageInput);
            Console.WriteLine("Ejecutamos acciones en la base de datos");

            if (!IsExistingUser(username))
            {
                InsertUser(new(username, password));
            }
            Console.WriteLine("Confirmo los cambios");
            return 0;
        }

        public static void RegistrerUserWithValidations(string username, string password, string ageInput)
        {
            Console.WriteLine("Iniciamos el proceso de registro de clientes");
            try
            {
                Console.WriteLine("Abrimos transacción");
                int age = Convert.ToInt32(ageInput);
                Console.WriteLine("Ejecutamos acciones en la base de datos");

                if (!IsExistingUser(username))
                {
                    InsertUser(new(username, password));
                }
                Console.WriteLine("Confirmo los cambios");
            }
            catch (CustomAppException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine("Rollback");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Rollback");
            }
        }

        private static int ValidateAge(string ageInput)
        {
            if (!int.TryParse(ageInput, out int age))
            {
                throw new CustomAppException("La edad viene en un formato incorrecto", eErrorTipo.Validacion);
            }
            if (age < MIN_AGE || age> MAX_AGE)
            {
                throw new CustomAppException($"La edad debe estar entre los  {MIN_AGE} y los {MAX_AGE}", eErrorTipo.Validacion);
            }

            return age;
        }

        public static bool IsExistingUser(string username)
        {
            return UserList != null && UserList.Any(user => user.Username == username);
        }

        public static bool InsertUser(User user)
        {
            user.UserId = UserList != null ? (UserList.Max(user => user.UserId) + 1) : 1;

            if (UserList == null)
            {
                UserList = new();
            }

            UserList.Add(user);

            #region if
            //if (UserList != null)
            //    UserList.Add(user);
            //else
            //{
            //    UserList = new();
            //    UserList.Add(user);
            //} 
            #endregion

            Console.WriteLine("Acción ejecutada en bas de datos => Usuario insertado Correctamente");

            return true;
        }
    }
}
