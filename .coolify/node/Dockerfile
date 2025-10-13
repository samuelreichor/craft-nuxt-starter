# ---------- Build Stage ----------
FROM node:22-alpine AS build
WORKDIR /app

COPY package.json package-lock.json ./
COPY frontend/package.json frontend/package.json

RUN npm ci --workspaces --include-workspace-root

COPY frontend/ ./
RUN npm run build

# ---------- Runtime Stage ----------
FROM node:22-alpine
WORKDIR /app

COPY --from=build /app/.output/ ./

EXPOSE 3000

CMD ["node", "/app/server/index.mjs"]
