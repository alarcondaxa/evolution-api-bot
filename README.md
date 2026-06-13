# Evolution API Bot – Portal Segunda Via Equatorial

Bot WhatsApp integrado ao Portal Segunda Via da Equatorial Energia, usando a [Evolution API v2](https://doc.evolution-api.com).

---

## Deploy no Railway (recomendado)

### 1. Faça o fork ou clone este repositório no GitHub

### 2. Acesse [railway.app](https://railway.app) e faça login com GitHub

### 3. Crie um novo projeto
- Clique em **New Project**
- Selecione **Deploy from GitHub repo**
- Escolha este repositório `evolution-api-bot`

### 4. Configure as variáveis de ambiente no Railway
Vá em **Variables** e adicione:

| Variável | Valor |
|---|---|
| `SERVER_URL` | URL do seu serviço no Railway (ex: `https://evolution-api-bot-production.up.railway.app`) |
| `AUTHENTICATION_API_KEY` | Uma senha forte (ex: `minha_chave_super_secreta_123`) |
| `WEBHOOK_URL` | URL do webhook do seu site (ex: `https://eqportal-etzzmwaf.manus.space/api/webhook/evolution`) |

### 5. Aguarde o deploy terminar (~2 minutos)

### 6. Anote a URL pública gerada pelo Railway
Será algo como: `https://evolution-api-bot-production.up.railway.app`

---

## Configurar no Painel Admin do Site

1. Acesse seu site → **Admin** → aba **🤖 Bot Evolution API**
2. Preencha:
   - **URL da Evolution API**: a URL do Railway (ex: `https://evolution-api-bot-production.up.railway.app`)
   - **API Key**: a mesma senha que você colocou em `AUTHENTICATION_API_KEY`
   - **Nome da Instância**: `ceee-bot` (ou qualquer nome)
3. Clique em **Salvar + Testar Conexão**

---

## Criar Instância e Conectar WhatsApp

Após configurar no painel admin, clique em **Criar Instância** e depois **Gerar QR Code**.
Escaneie o QR Code com o WhatsApp do número que vai atender os clientes.

---

## Fluxo do Bot

Quando um cliente enviar mensagem para o seu número:
- **"Segunda Via"** → bot registra e responde pedindo confirmação
- **CPF ou CNPJ** → bot valida, salva no painel admin e responde com instruções
- **Qualquer outra mensagem** → bot exibe menu de opções

---

## Suporte

Projeto desenvolvido com [Manus](https://manus.im).
