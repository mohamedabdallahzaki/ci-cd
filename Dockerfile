# =========================
# 1. Build
# =========================
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src

# Copy application project
COPY ci-cd.csproj ./

# Restore application dependencies
RUN dotnet restore ci-cd.csproj

# Copy source code
COPY . .

# Publish application
RUN dotnet publish ci-cd.csproj \
    -c Release \
    -o /app/publish \
    --no-restore


# =========================
# 2. Runtime
# =========================
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final

WORKDIR /app

# Copy published application
COPY --from=build /app/publish .

EXPOSE 8080

# Start application
ENTRYPOINT ["dotnet", "ci-cd.dll"]