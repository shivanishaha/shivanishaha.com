# syntax=docker/dockerfile:1
# Shared Dockerfile for the Angular sites (eshakadakia.com, shivanishaha.com, cosmos).
# Stage 1 builds the production bundle, stage 2 serves it with nginx (~20 MB image).

FROM node:22-alpine AS build
WORKDIR /app

# Install dependencies first so this layer is cached until package*.json changes.
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    if [ -f package-lock.json ]; then npm ci --no-audit --no-fund; \
    else npm install --no-audit --no-fund; fi

COPY . .
# Every project writes to dist/<project-name>/browser; copy it to a fixed path
# so this Dockerfile works unchanged in all three repos.
RUN npx ng build --configuration production \
 && mkdir -p /out && cp -r dist/*/browser/. /out/

FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /out /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=60s --timeout=3s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
