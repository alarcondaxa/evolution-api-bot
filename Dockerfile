# Usa a imagem oficial da Evolution API v2 (atendai/evolution-api)
# O entrypoint padrão da imagem já inicia o servidor corretamente
FROM atendai/evolution-api:v2.2.3

# Variáveis de ambiente padrão (serão sobrescritas pelas variáveis do Railway)
ENV SERVER_URL=http://localhost:8080
ENV AUTHENTICATION_API_KEY=changeme
ENV CACHE_REDIS_ENABLED=false
ENV CACHE_LOCAL_ENABLED=true
ENV DEL_INSTANCE=false
ENV LANGUAGE=pt-BR
ENV CONFIG_SESSION_PHONE_CLIENT=EquatorialBot
ENV CONFIG_SESSION_PHONE_NAME=Chrome
ENV QRCODE_LIMIT=30
ENV LOG_LEVEL=ERROR
ENV LOG_COLOR=true
ENV LOG_BAILEYS=error

EXPOSE 8080
