FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY efcore-tenancy.csproj ./
RUN dotnet restore "./efcore-tenancy.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "efcore-tenancy.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "efcore-tenancy.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "efcore-tenancy.dll"]
