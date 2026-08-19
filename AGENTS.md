# MCP integration

- The Oh My Pi MCP configuration is versioned at `/home/talon/Code/dotfiles/omp/.omp/agent/mcp.json`.
- When changing a service in `compose.yaml`, update that server's OMP configuration in the dotfiles repository in the same change.
- For a newly added service or any change to a server's activation, ask whether it should be enabled by default; do not infer the setting.
