FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /app
ENV PATH="$PATH:/root/.dotnet/tools"
ARG SONAR_LOGIN_TOKEN
LABEL project="ecovalciuc-bookscatalog"

# To be sure that docker var received SONAR_LOGIN_TOKEN
RUN "printenv"

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    dotnet tool install --global dotnet-sonarscanner

RUN dotnet sonarscanner begin \
/n:"ecovalciuc-Books_Catalog" \
/k:"dotnet_project" \
/d:sonar.host.url="https://sonar.trydevops.com" \
/d:sonar.login="${SONAR_LOGIN_TOKEN}" \
/d:sonar.cs.opencover.reportsPaths=coverage.opencover.xml

COPY ./ /app

RUN dotnet restore -v m

RUN dotnet build --no-restore -c Release --nologo
RUN dotnet publish -c Release -o out BooksCatalog.Web/BooksCatalog.Web.csproj

RUN dotnet sonarscanner end -d:sonar.login="${SONAR_LOGIN_TOKEN}"



FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "BooksCatalog.Web.dll"]
EXPOSE 80
