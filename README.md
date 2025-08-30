```markdown
# ☁️ OwnCloud DevOps Setup

A complete **OwnCloud** deployment environment powered by **Docker Compose**, **MariaDB**, and **Redis**, featuring a fully automated **CI/CD pipeline** with **GitHub Actions**.  
This setup works equally well for **local development** and **production deployment**.

---

## 📂 Project Structure

```
.
├── .env                        # Environment variables
├── docker-compose.yml          # Services: OwnCloud, MariaDB, Redis
├── Dockerfile                  # Custom OwnCloud image build
├── .github/
│   └── workflows/
│       └── docker-build.yml    # GitHub Actions workflow for CI/CD
└── README.md                   # Project documentation
```

---

## ⚙️ Prerequisites

- [Docker](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/)
- (Optional) Docker Hub or GitHub Container Registry account
- GitHub repository with appropriate **Secrets** configured

---

## 🔧 Environment Setup

1. Create or update the `.env` file with your desired configuration:

    ```env
    OWNCLOUD_VERSION=10.13
    HTTP_PORT=8080
    OWNCLOUD_DOMAIN=cloud.example.com
    OWNCLOUD_TRUSTED_DOMAINS=cloud.example.com
    OWNCLOUD_DB_NAME=owncloud
    OWNCLOUD_DB_USERNAME=owncloud
    OWNCLOUD_DB_PASSWORD=SuperSecretPass
    MYSQL_ROOT_PASSWORD=RootSecretPass
    ADMIN_USERNAME=admin
    ADMIN_PASSWORD=admin
    DOCKER_USER=username
    ```

2. Add the following GitHub Secrets to your repository:
   - `DOCKER_USER` → Docker Hub / GHCR username  
   - `DOCKER_PASS` → Docker Hub / GHCR password or token  

---

## ▶️ Local Development Run

```bash
docker compose --env-file .env up -d
```

Access the application at:  
[http://localhost:8080](http://localhost:8080)

---

## 🚀 CI/CD Workflow

**Process:**
1. Push changes to the `main` branch.
2. **GitHub Actions** will:
   - Build the custom OwnCloud image using the `Dockerfile`.
   - *(Optional)* Push it to Docker Hub or GHCR with:
     - `latest` tag
     - commit SHA tag
3. On the production server:
    ```bash
    docker compose pull
    docker compose up -d
    ```

---

## 📦 Production Notes

- Use a separate `docker-compose.prod.yml` for SSL and reverse proxy setup (e.g., **Traefik**, **Nginx**).
- Add monitoring & logging with tools like **Prometheus**, **Grafana**, and **Loki**.
- Implement automated backups for:
  - Database
  - OwnCloud data directory

---

## 🩺 Service Healthchecks

- **OwnCloud** → `/usr/bin/healthcheck`  
- **MariaDB** → `mysqladmin ping`  
- **Redis** → `redis-cli ping`

---

## 📜 License

Released under the [MIT License](LICENSE).
```
