FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src

COPY ci-cd.csproj ./

RUN dotnet restore ci-cd.csproj

COPY . .

RUN dotnet publish ci-cd.csproj -c Release -o /app/publish --no-restore


FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final

WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080

ENTRYPOINT ["dotnet", "ci-cd.dll"]