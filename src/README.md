# MCP Server with Multiple Tools

This is a Model Context Protocol (MCP) server that can be hosted on Azure App Service. The server supports Server-Sent Events (SSE) and implements several useful tools including multiplication, temperature conversion, and weather data.

## Features

- MCP server implementation using the C# SDK
- Support for Server-Sent Events (SSE)
- CORS enabled for browser clients
- Multiple useful tools:
  - Multiplication tool for number calculations
  - Temperature conversion tools (Celsius to Fahrenheit and vice versa)
  - Weather tools for retrieving forecasts and alerts
- Ready for Azure App Service deployment

## Development

### Prerequisites

- .NET 9.0 SDK or later

### Running Locally

To run the server locally:

```bash
dotnet run --project McpServer.csproj
```

The server will be available at http://localhost:5269.

### Testing the Available Tools

You can use any MCP client that supports SSE to connect to the server and use the following tools:

#### Multiplication Tool
The multiplication tool takes two parameters:
- `a`: The first number to multiply
- `b`: The second number to multiply

#### Temperature Conversion Tools
The temperature conversion tools provide two methods:
- `CelsiusToFahrenheit`: Converts a temperature from Celsius to Fahrenheit
  - `celsius`: The temperature in Celsius to convert
- `FahrenheitToCelsius`: Converts a temperature from Fahrenheit to Celsius
  - `fahrenheit`: The temperature in Fahrenheit to convert

#### Weather Tools
The weather tools provide real-time weather data:
- `GetAlerts`: Get active weather alerts for a US state
  - `state`: The US state code (e.g., "TX", "CA")
- `GetForecast`: Get weather forecast for a specific location
  - `latitude`: Latitude of the location
  - `longitude`: Longitude of the location

You can ask things like:
- What's the weather forecast in NYC?
- Are there any weather alerts in California?

## Deployment to Azure

The project includes an Azure deployment template (`azuredeploy.json`) that can be used to deploy the application to Azure App Service.

### Deployment Steps

1. Build the application for release:
   ```bash
   dotnet publish -c Release
   ```

2. Deploy to Azure using the Azure CLI:
   ```bash
   cd src
   az login
   az webapp up
   ```