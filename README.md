# Portfolio XP

Windows XP themed portfolio. React frontend, Node.js/TypeScript backend, MySQL database, Nginx reverse proxy.

## Getting started (local development)

### 1. Clone the repo
```bash
git clone --recurse-submodules <repo-url>
cd portfolio_XP_monorepo
```
> `--recurse-submodules` is required because `packages/server` is a git submodule.

### 2. Create your .env file
```bash
cp .env.example .env
```
Edit `.env` if needed — defaults work for local development out of the box.

### 3. Build and start
```bash
docker-compose build
docker-compose up
```
App runs at **http://localhost**

---

## Production deploy

Handled automatically via GitHub Actions on push to `main`. Certbot (SSL) runs only in production via the `--profile production` flag.

Make sure the following secrets are set in GitHub repository settings:
- `SERVER_SERVICE_PORT`
- `MYSQL_ROOT_PASSWORD`
- `MYSQL_DATABASE`
- `MYSQL_HOST`
- `DB_PORT`
- `DOMAIN_NAME`
- `SSH_IP`
- `SSH_KEY`
- `SSH_PASSPHRASE`
