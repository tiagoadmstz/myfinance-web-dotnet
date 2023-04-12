# .NET SDK (7.0.203)
# dotnet new mvc -n myfinance-web-dotnet
FROM mcr.microsoft.com/dotnet/sdk:7.0
WORKDIR /home/myfinance-web-dotnet

CMD dotnet build && \
    chmod -Rf 777 /home/myfinance-web-dotnet/ && \
    dotnet /home/myfinance-web-dotnet/bin/Debug/net7.0/myfinance-web-dotnet.dll
