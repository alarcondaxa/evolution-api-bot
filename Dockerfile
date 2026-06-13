# ============================================================
# Evolution API – Build completo a partir do código fonte
# Baseado no Dockerfile oficial do repositório EvolutionAPI
# ============================================================

FROM node:24-alpine AS builder

RUN apk update && \
    apk add --no-cache git ffmpeg wget curl bash openssl

WORKDIR /evolution

# Clonar o repositório oficial da Evolution API v2
RUN git clone --depth=1 --branch main https://github.com/EvolutionAPI/evolution-api.git .

# Instalar dependências
RUN npm ci --silent

# Copiar .env de exemplo e tornar scripts executáveis
RUN cp .env.example .env && \
    chmod +x ./Docker/scripts/*

# Gerar Prisma client
RUN ./Docker/scripts/generate_database.sh

# Build TypeScript
RUN npm run build

# ============================================================
# Imagem final – apenas o necessário para rodar
# ============================================================
FROM node:24-alpine AS final

RUN apk update && \
    apk add --no-cache tzdata ffmpeg bash openssl

ENV TZ=America/Sao_Paulo
ENV DOCKER_ENV=true

WORKDIR /evolution

COPY --from=builder /evolution/package.json ./package.json
COPY --from=builder /evolution/package-lock.json ./package-lock.json
COPY --from=builder /evolution/node_modules ./node_modules
COPY --from=builder /evolution/dist ./dist
COPY --from=builder /evolution/prisma ./prisma
COPY --from=builder /evolution/manager ./manager
COPY --from=builder /evolution/public ./public
COPY --from=builder /evolution/.env ./.env
COPY --from=builder /evolution/Docker ./Docker
COPY --from=builder /evolution/runWithProvider.js ./runWithProvider.js
COPY --from=builder /evolution/tsup.config.ts ./tsup.config.ts

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "-c", ". ./Docker/scripts/deploy_database.sh && npm run start:prod"]
