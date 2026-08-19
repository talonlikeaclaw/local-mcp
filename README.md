# Local MCP

Docker Compose services for local Context7, time, weather, Dockerhub, and Next.js DevTools MCP servers.

## Setup

```bash
cp .env.example .env
docker compose build
```

Add `CONTEXT7_API_KEY` and `dockerhub.pat_token` to `.env`.

## Connect an MCP client

Configure the required service as a stdio MCP server:

```json
{
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
```

`next-devtools` requires a Next.js 16+ development server running on the host. Its container uses host networking to discover the development server; call `nextjs_index` first to list its available runtime tools.

The MCP client starts and stops the service. Do not use `docker compose up`.
