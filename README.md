# Local MCP

A Docker Compose wrapper for the [Context7 MCP server](https://github.com/upstash/context7). It uses stdio transport, so an MCP client launches the Compose service and communicates over its standard input/output.

## Setup

1. Create the ignored credential file and set your Context7 API key:

   ```bash
   cp .env.example .env
   ```

   Set `CONTEXT7_API_KEY` in `.env`. The file is ignored by Git.

2. Build the image:

   ```bash
   docker compose build
   ```

## Connect an MCP client

Configure a stdio MCP server that runs the Compose service:

```json
{
  "mcpServers": {
    "context7": {
      "command": "docker",
      "args": [
        "compose",
        "-f",
        "/absolute/path/to/local-mcp/compose.yaml",
        "run",
        "--rm",
        "-T",
        "context7"
      ]
    }
  }
}
```

Replace the path with this repository's absolute path. Docker Compose loads the adjacent `.env` file and supplies `CONTEXT7_API_KEY` to the container. Do not run `docker compose up`: stdio MCP servers must be launched by their client.
