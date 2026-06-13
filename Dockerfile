FROM atendai/evolution-api:v2.2.3

EXPOSE 8080

CMD ["node", "dist/main.js"]
