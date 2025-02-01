using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;


var builder = WebApplication.CreateBuilder(args);

// string connectionString = Environment.GetEnvironmentVariable("DefaultConnection") 
//                          ?? "User Id=ADRIAN;Password=SuperSecretPassword;Data Source=localhost:1521/XEPDB1";

var connectionString = "User Id=ADRIAN;Password=SuperSecretPassword;Data Source=oracledb:1521/XEPDB1";

// Register the IDbConnection as a scoped service if you like (optional)
builder.Services.AddScoped<IDbConnection>(sp =>
    new OracleConnection(connectionString));

// Add Swagger services
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseHttpsRedirection();
app.UseSwagger();
app.UseSwaggerUI();  // Default URL is /swagger

app.MapGet("/stadiums", async () =>
{
    // Define your connection string
    string conString = "User Id=ADRIAN;Password=SuperSecretPassword;Data Source=oracledb:1521/XEPDB1;";
    var stadiums = new List<Stadium>();

    try
    {
        await using OracleConnection con = new OracleConnection(conString);
        await using OracleCommand cmd = con.CreateCommand();
        con.Open();
        // Set up the stored procedure call.
        cmd.CommandText = "list_stadiums_cursor";
        cmd.CommandType = CommandType.StoredProcedure;

        // Create the output parameter for the SYS_REFCURSOR.
        OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
        {
            Direction = ParameterDirection.Output
        };
        cmd.Parameters.Add(p_cursor);

        // Execute the stored procedure.
        cmd.ExecuteNonQuery();

        // Retrieve the ref cursor.
        OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
        using (OracleDataReader reader = refCursor.GetDataReader())
        {
            while (reader.Read())
            {
                stadiums.Add(new Stadium(
                    reader.GetInt32(reader.GetOrdinal("StadiumId")),
                    reader.GetString(reader.GetOrdinal("Name")),
                    reader.GetDecimal(reader.GetOrdinal("Capacity")),
                    reader.GetString(reader.GetOrdinal("Location"))
                ));
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem(ex.Message);
    }

    // Return the list of stadiums as a JSON array.
    return Results.Ok(stadiums);
});

app.MapGet("/teams", async () =>
{
    var teams = new List<Team>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "list_teams_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Create the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();

                // Execute the stored procedure. 
                // The result set comes back via the output parameter.
                cmd.ExecuteNonQuery();

                // Retrieve the OracleRefCursor and then its data reader.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        teams.Add(new Team(
                            reader.GetInt32(reader.GetOrdinal("TeamID")),
                            reader.GetString(reader.GetOrdinal("Name")),
                            reader.GetString(reader.GetOrdinal("City")),
                            reader.IsDBNull(reader.GetOrdinal("StadiumID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("StadiumID")),
                            reader.IsDBNull(reader.GetOrdinal("Coach")) ? null : reader.GetString(reader.GetOrdinal("Coach")),
                            reader.IsDBNull(reader.GetOrdinal("Sponsorship")) ? null : reader.GetString(reader.GetOrdinal("Sponsorship"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem(ex.Message);
    }

    // Return the list of teams as JSON.
    return Results.Ok(teams);
});

app.MapGet("/players", async () =>
{

    var players = new List<Player>();
    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "list_players_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Create the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();

                // Execute the stored procedure.
                cmd.ExecuteNonQuery();

                // Retrieve the OracleRefCursor and get a data reader.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        players.Add(new Player(
                            reader.GetInt32(reader.GetOrdinal("PlayerID")),
                            reader.GetString(reader.GetOrdinal("FirstName")),
                            reader.GetString(reader.GetOrdinal("LastName")),
                            reader.IsDBNull(reader.GetOrdinal("DateOfBirth")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("DateOfBirth")),
                            reader.IsDBNull(reader.GetOrdinal("Position")) ? null : reader.GetString(reader.GetOrdinal("Position")),
                            reader.IsDBNull(reader.GetOrdinal("JerseyNumber")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("JerseyNumber")),
                            reader.IsDBNull(reader.GetOrdinal("ContactInfo")) ? null : reader.GetString(reader.GetOrdinal("ContactInfo")),
                            reader.IsDBNull(reader.GetOrdinal("ContractStart")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ContractStart")),
                            reader.IsDBNull(reader.GetOrdinal("ContractEnd")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ContractEnd")),
                            reader.IsDBNull(reader.GetOrdinal("Salary")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Salary")),
                            reader.IsDBNull(reader.GetOrdinal("TeamID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("TeamID"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem(ex.Message);
    }

    return Results.Ok(players);
});

app.MapGet("/seasons", async () =>
{
    var seasons = new List<Season>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                // Set the stored procedure name and type.
                cmd.CommandText = "list_seasons_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Add the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();

                // Execute the stored procedure.
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor from the output parameter.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        seasons.Add(new Season(
                            reader.GetDecimal(reader.GetOrdinal("SeasonID")),
                            reader.IsDBNull(reader.GetOrdinal("StartDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("StartDate")),
                            reader.IsDBNull(reader.GetOrdinal("EndDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("EndDate"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving seasons: " + ex.Message);
    }

    // Return the list of seasons as a JSON array.
    return Results.Ok(seasons);
});

app.MapGet("/referees", async () =>
{
    var referees = new List<Referee>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                // Set the stored procedure name and type.
                cmd.CommandText = "list_referees_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Create the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();

                // Execute the stored procedure.
                cmd.ExecuteNonQuery();

                // Retrieve the OracleRefCursor and then obtain a data reader.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        referees.Add(new Referee(
                            reader.GetDecimal(reader.GetOrdinal("RefereeID")),
                            reader.GetString(reader.GetOrdinal("FirstName")),
                            reader.GetString(reader.GetOrdinal("LastName")),
                            reader.IsDBNull(reader.GetOrdinal("Experience"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("Experience")),
                            reader.IsDBNull(reader.GetOrdinal("MatchesOfficiated"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("MatchesOfficiated"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving referees: " + ex.Message);
    }

    // Return the list of referees as a JSON array.
    return Results.Ok(referees);
});

app.MapGet("/matches", async () =>
{
    var matches = new List<Match>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "list_matches_with_names_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Add the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        matches.Add(new Match(
                            reader.GetDecimal(reader.GetOrdinal("MatchID")),
                            reader.GetDateTime(reader.GetOrdinal("MatchDate")),
                            reader.IsDBNull(reader.GetOrdinal("HomeTeamID")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("HomeTeamID")),
                            reader.IsDBNull(reader.GetOrdinal("HomeTeamName")) ? null : reader.GetString(reader.GetOrdinal("HomeTeamName")),
                            reader.IsDBNull(reader.GetOrdinal("AwayTeamID")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("AwayTeamID")),
                            reader.IsDBNull(reader.GetOrdinal("AwayTeamName")) ? null : reader.GetString(reader.GetOrdinal("AwayTeamName")),
                            reader.IsDBNull(reader.GetOrdinal("HomeScore")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("HomeScore")),
                            reader.IsDBNull(reader.GetOrdinal("AwayScore")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("AwayScore")),
                            reader.IsDBNull(reader.GetOrdinal("StadiumID")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("StadiumID")),
                            reader.IsDBNull(reader.GetOrdinal("StadiumName")) ? null : reader.GetString(reader.GetOrdinal("StadiumName")),
                            reader.IsDBNull(reader.GetOrdinal("RefereeID")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("RefereeID")),
                            reader.IsDBNull(reader.GetOrdinal("RefereeName")) ? null : reader.GetString(reader.GetOrdinal("RefereeName"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving matches: " + ex.Message);
    }

    return Results.Ok(matches);
});

app.MapGet("/transfers", async () =>
{
    var transfers = new List<Transfer>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "list_transfers_with_names_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Add the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor and read the data.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        transfers.Add(new Transfer(
                            reader.GetDecimal(reader.GetOrdinal("TransferID")),
                            reader.IsDBNull(reader.GetOrdinal("TransferDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("TransferDate")),
                            reader.IsDBNull(reader.GetOrdinal("TransferFee"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("TransferFee")),
                            reader.IsDBNull(reader.GetOrdinal("PlayerID"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("PlayerID")),
                            reader.IsDBNull(reader.GetOrdinal("PlayerName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("PlayerName")),
                            reader.IsDBNull(reader.GetOrdinal("FromTeamID"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("FromTeamID")),
                            reader.IsDBNull(reader.GetOrdinal("FromTeamName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("FromTeamName")),
                            reader.IsDBNull(reader.GetOrdinal("ToTeamID"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("ToTeamID")),
                            reader.IsDBNull(reader.GetOrdinal("ToTeamName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("ToTeamName"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving transfers: " + ex.Message);
    }

    return Results.Ok(transfers);
});

app.MapGet("/sponsors", async () =>
{
    var sponsors = new List<Sponsor>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                // Set the stored procedure name and type.
                cmd.CommandText = "list_sponsors_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Create the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor and obtain a data reader.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        sponsors.Add(new Sponsor(
                            reader.GetDecimal(reader.GetOrdinal("SponsorID")),
                            reader.GetString(reader.GetOrdinal("Name")),
                            reader.IsDBNull(reader.GetOrdinal("SponsorshipType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("SponsorshipType")),
                            reader.IsDBNull(reader.GetOrdinal("ContractDetails"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("ContractDetails"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving sponsors: " + ex.Message);
    }

    // Return the list of sponsors as a JSON array.
    return Results.Ok(sponsors);
});

app.MapGet("/playerstatistics", async () =>
{
    var stats = new List<PlayerStatistic>();

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "list_player_statistics_cursor";
                cmd.CommandType = CommandType.StoredProcedure;

                // Create the output parameter for the SYS_REFCURSOR.
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor and read the data.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    while (reader.Read())
                    {
                        stats.Add(new PlayerStatistic(
                            reader.GetDecimal(reader.GetOrdinal("PlayerStatisticID")),
                            reader.IsDBNull(reader.GetOrdinal("PlayerID"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("PlayerID")),
                            reader.IsDBNull(reader.GetOrdinal("PlayerName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("PlayerName")),
                            reader.IsDBNull(reader.GetOrdinal("SeasonID"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("SeasonID")),
                            reader.IsDBNull(reader.GetOrdinal("StartDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("StartDate")),
                            reader.IsDBNull(reader.GetOrdinal("EndDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("EndDate")),
                            reader.IsDBNull(reader.GetOrdinal("Goals"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("Goals")),
                            reader.IsDBNull(reader.GetOrdinal("Assists"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("Assists")),
                            reader.IsDBNull(reader.GetOrdinal("MinutesPlayed"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("MinutesPlayed")),
                            reader.IsDBNull(reader.GetOrdinal("YellowCards"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("YellowCards")),
                            reader.IsDBNull(reader.GetOrdinal("RedCards"))
                                ? (decimal?)null
                                : reader.GetDecimal(reader.GetOrdinal("RedCards"))
                        ));
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving player statistics: " + ex.Message);
    }

    return Results.Ok(stats);
});

app.MapPost("/players", async (PlayerCreate player) =>
{
    try
    {
        using var con = new OracleConnection(connectionString);
        using var cmd = con.CreateCommand();
        cmd.CommandText = "insert_player";
        cmd.CommandType = CommandType.StoredProcedure;
        
        // Create input parameters
        cmd.Parameters.Add(new OracleParameter("p_firstname", OracleDbType.Varchar2, player.FirstName, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_lastname", OracleDbType.Varchar2, player.LastName, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_dateofbirth", OracleDbType.Date, player.DateOfBirth, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_position", OracleDbType.Varchar2, player.Position, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_jerseynumber", OracleDbType.Int32, player.JerseyNumber, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_contactinfo", OracleDbType.Varchar2, player.ContactInfo, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_contractstart", OracleDbType.Date, player.ContractStart, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_contractend", OracleDbType.Date, player.ContractEnd, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_salary", OracleDbType.Decimal, player.Salary, ParameterDirection.Input));
        cmd.Parameters.Add(new OracleParameter("p_teamid", OracleDbType.Int32, player.TeamID, ParameterDirection.Input));
        
        // Create the output parameter for the new PlayerID.
        var outputParam = new OracleParameter("p_new_playerid", OracleDbType.Int32)
        {
            Direction = ParameterDirection.Output
        };
        cmd.Parameters.Add(outputParam);
        
        con.Open();
        cmd.ExecuteNonQuery();
        
        // The output parameter returns an OracleDecimal. Convert it to int.
        int newPlayerId = ((OracleDecimal)outputParam.Value).ToInt32();
        
        return Results.Ok(new { PlayerID = newPlayerId });
    }
    catch (Exception ex)
    {
        return Results.Problem("Error inserting player: " + ex.Message);
    }
});

app.MapPut("/players/{id:int}", async (int id, UpdatePlayerRequest req) =>
{
    // Ensure the route id matches the request body id.
    if (id != req.PlayerID)
    {
        return Results.BadRequest("Route id does not match the request body PlayerID.");
    }
    try
    {
        using OracleConnection con = new OracleConnection(connectionString);
        using OracleCommand cmd = con.CreateCommand();
        cmd.CommandText = "update_player";
        cmd.CommandType = CommandType.StoredProcedure;

        // Add input parameters including the PlayerID.
        cmd.Parameters.Add(new OracleParameter("p_playerid", req.PlayerID));
        cmd.Parameters.Add(new OracleParameter("p_firstname", req.FirstName));
        cmd.Parameters.Add(new OracleParameter("p_lastname", req.LastName));
        cmd.Parameters.Add(new OracleParameter("p_dateofbirth", req.DateOfBirth.HasValue ? (object)req.DateOfBirth.Value : DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_position", req.Position ?? (object)DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_jerseynumber", req.JerseyNumber.HasValue ? (object)req.JerseyNumber.Value : DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_contactinfo", req.ContactInfo ?? (object)DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_contractstart", req.ContractStart.HasValue ? (object)req.ContractStart.Value : DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_contractend", req.ContractEnd.HasValue ? (object)req.ContractEnd.Value : DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_salary", req.Salary.HasValue ? (object)req.Salary.Value : DBNull.Value));
        cmd.Parameters.Add(new OracleParameter("p_teamid", req.TeamID.HasValue ? (object)req.TeamID.Value : DBNull.Value));

        con.Open();
        cmd.ExecuteNonQuery();

        return Results.Ok($"Player {req.PlayerID} updated successfully.");
    }
    catch (Exception ex)
    {
        return Results.Problem("Error updating player: " + ex.Message);
    }
});

app.MapDelete("/players/{id:int}", async (int id) =>
{
    try
    {
        using OracleConnection con = new OracleConnection(connectionString);
        using OracleCommand cmd = con.CreateCommand();
        cmd.CommandText = "delete_player";
        cmd.CommandType = CommandType.StoredProcedure;

        // Add the PlayerID parameter.
        cmd.Parameters.Add(new OracleParameter("p_playerid", id));

        con.Open();
        cmd.ExecuteNonQuery();

        return Results.Ok($"Player {id} deleted successfully.");
    }
    catch (Exception ex)
    {
        return Results.Problem("Error deleting player: " + ex.Message);
    }
});

app.MapGet("/players/{id}", async (decimal id) =>
{
    Player? player = null;

    try
    {
        using (OracleConnection con = new OracleConnection(connectionString))
        {
            using (OracleCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = "get_player_by_id";
                cmd.CommandType = CommandType.StoredProcedure;

                // Input parameter: p_playerid
                cmd.Parameters.Add(new OracleParameter("p_playerid", OracleDbType.Int32)
                {
                    Direction = ParameterDirection.Input,
                    Value = id
                });

                // Output parameter: p_cursor
                OracleParameter p_cursor = new OracleParameter("p_cursor", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(p_cursor);

                con.Open();
                cmd.ExecuteNonQuery();

                // Retrieve the ref cursor and read the data.
                OracleRefCursor refCursor = (OracleRefCursor)p_cursor.Value;
                using (OracleDataReader reader = refCursor.GetDataReader())
                {
                    if (reader.Read())
                    {
                        player = new Player(
                            reader.GetDecimal(reader.GetOrdinal("PlayerID")),
                            reader.GetString(reader.GetOrdinal("FirstName")),
                            reader.GetString(reader.GetOrdinal("LastName")),
                            reader.IsDBNull(reader.GetOrdinal("DateOfBirth")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("DateOfBirth")),
                            reader.IsDBNull(reader.GetOrdinal("Position")) ? null : reader.GetString(reader.GetOrdinal("Position")),
                            reader.IsDBNull(reader.GetOrdinal("JerseyNumber")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("JerseyNumber")),
                            reader.IsDBNull(reader.GetOrdinal("ContactInfo")) ? null : reader.GetString(reader.GetOrdinal("ContactInfo")),
                            reader.IsDBNull(reader.GetOrdinal("ContractStart")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ContractStart")),
                            reader.IsDBNull(reader.GetOrdinal("ContractEnd")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ContractEnd")),
                            reader.IsDBNull(reader.GetOrdinal("Salary")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Salary")),
                            reader.IsDBNull(reader.GetOrdinal("TeamID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("TeamID"))
                        );
                    }
                }
            }
        }
    }
    catch (Exception ex)
    {
        return Results.Problem("Error retrieving player: " + ex.Message);
    }

    return player is not null ? Results.Ok(player) : Results.NotFound();
});

app.Run();

record Stadium
(
    decimal StadiumId,
    string Name,
    decimal Capacity,
    string Location
);

public record Team(
    decimal TeamID,
    string Name,
    string City,
    decimal? StadiumID,
    string Coach,
    string Sponsorship
);

record Player(
    decimal PlayerID,
    string FirstName,
    string LastName,
    DateTime? DateOfBirth,
    string? Position,
    decimal? JerseyNumber,
    string? ContactInfo,
    DateTime? ContractStart,
    DateTime? ContractEnd,
    decimal? Salary,
    decimal? TeamID
);

record Season(decimal SeasonID, DateTime? StartDate, DateTime? EndDate);

record Referee(
    decimal RefereeID,
    string FirstName,
    string LastName,
    string? Experience,
    decimal? MatchesOfficiated
);

record Match(
    decimal MatchID,
    DateTime MatchDate,
    decimal? HomeTeamID,
    string? HomeTeamName,
    decimal? AwayTeamID,
    string? AwayTeamName,
    decimal? HomeScore,
    decimal? AwayScore,
    decimal? StadiumID,
    string? StadiumName,
    decimal? RefereeID,
    string? RefereeName
);

record Transfer(
    decimal TransferID,
    DateTime? TransferDate,
    decimal? TransferFee,
    decimal? PlayerID,
    string? PlayerName,
    decimal? FromTeamID,
    string? FromTeamName,
    decimal? ToTeamID,
    string? ToTeamName
);

record Sponsor(
    decimal SponsorID,
    string Name,
    string? SponsorshipType,
    string? ContractDetails
);

record PlayerStatistic(
    decimal PlayerStatisticID,
    decimal? PlayerID,
    string? PlayerName,
    decimal? SeasonID,
    DateTime? SeasonStartDate,
    DateTime? SeasonEndDate,
    decimal? Goals,
    decimal? Assists,
    decimal? MinutesPlayed,
    decimal? YellowCards,
    decimal? RedCards
);

record PlayerCreate(
    string FirstName,
    string LastName,
    DateTime? DateOfBirth,
    string? Position,
    int? JerseyNumber,
    string? ContactInfo,
    DateTime? ContractStart,
    DateTime? ContractEnd,
    decimal? Salary,
    int? TeamID
);

// For updating an existing player (includes the PlayerID)
record UpdatePlayerRequest(
    int PlayerID,
    string FirstName,
    string LastName,
    DateTime? DateOfBirth,
    string? Position,
    int? JerseyNumber,
    string? ContactInfo,
    DateTime? ContractStart,
    DateTime? ContractEnd,
    decimal? Salary,
    int? TeamID
);

// (Optional) Response record – here we just return the new PlayerID on creation.
record CreatePlayerResponse(int PlayerID);


