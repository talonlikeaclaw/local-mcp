# Local MCP

Docker Compose services for local Context7, time, weather, Dockerhub, and Next.js DevTools MCP servers.

## Setup

```bash
cp .env.example .env
docker compose build
```

Add `CONTEXT7_API_KEY` and `dockerhub.pat_token` to `.env`.

The weather image is published for `linux/amd64`; Docker Desktop emulates it on Apple Silicon.

## Connect an MCP client

Configure the required service as a stdio MCP server. Set `LOCAL_MCP_DIR` to the absolute path of this checkout; `sh -c` expands it on macOS and Linux:

```json
{
  "command": "sh",
  "args": [
    "-c",
    "exec docker compose -f \"${LOCAL_MCP_DIR:?Set LOCAL_MCP_DIR to the local-mcp checkout}/compose.yaml\" run --rm -T context7"
  ]
}
```

`next-devtools` requires a Next.js 16+ development server running on the host. Its container uses host networking to discover the development server; call `nextjs_index` first to list its available runtime tools.

The MCP client starts and stops the service. Do not use `docker compose up`.
