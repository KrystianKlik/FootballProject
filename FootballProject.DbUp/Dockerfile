# Stage 1: Base Runtime Image
FROM mcr.microsoft.com/dotnet/runtime:9.0 AS base
# Optional: Define APP_UID if needed
# ARG APP_UID=1000
# USER $APP_UID
WORKDIR /app

# Stage 2: Build Image
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy the .csproj file into /src/FootballProject.DbUp/
COPY ["FootballProject.DbUp.csproj", "FootballProject.DbUp/"]

# Restore dependencies
RUN dotnet restore "FootballProject.DbUp/FootballProject.DbUp.csproj"

# Copy the remaining source code into /src/
COPY . .

# Set the working directory to /src/FootballProject.DbUp/
WORKDIR "/src/FootballProject.DbUp"

# Build the project
RUN dotnet build "FootballProject.DbUp.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Stage 3: Publish Image
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "FootballProject.DbUp.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Stage 4: Final Image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FootballProject.DbUp.dll"]
