using System;
using DbUp;

namespace FootballProject.DbUp
{
    class Program
    {
        static int Main(string[] args)
        {
            // Create the connection string
            string connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING") 
                                      ?? "Host=localhost;Port=5432;Database=Ekstraklasa;Username=Adrian;Password=SuperSecretPassword;";

            // Ensure the target database exists
            EnsureDatabase.For.PostgresqlDatabase(connectionString);

            // Configure the upgrader
            var upgrader = DeployChanges.To
                .PostgresqlDatabase(connectionString)
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