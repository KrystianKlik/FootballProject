using System;
using System.Reflection;
using DbUp;
using DbUp.Oracle;

namespace FootballProject.DbUp
{
    class Program
    {
        static int Main(string[] args)
        {

            string connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING") 
                                      ?? "User Id=ADRIAN;Password=SuperSecretPassword;Data Source=localhost:1521/XEPDB1";


            
            // Configure the upgrader
            var upgrader = DeployChanges.To
                .OracleDatabaseWithDefaultDelimiter(connectionString)  // instead of OracleDatabaseWithSemicolonDelimiter
                .WithScriptsFromFileSystem("/app/scripts")
                .LogToConsole()
                .Build();

            // Perform the upgrade
            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
                return -1; // Indicate failure
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0; // Indicate success
        }
    }
}