FROM node:20-alpine

RUN npm install --global @upstash/context7-mcp

ENTRYPOINT ["context7-mcp"]
CMD ["--transport", "stdio"]
