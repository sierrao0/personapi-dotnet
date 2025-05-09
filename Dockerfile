# Base image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080

# Build image
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["personapi-dotnet.csproj", "."]
RUN dotnet restore "personapi-dotnet.csproj"
COPY . .
RUN dotnet build "personapi-dotnet.csproj" -c Release -o /app/build

# Publish image
FROM build AS publish
RUN dotnet publish "personapi-dotnet.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "personapi-dotnet.dll"]