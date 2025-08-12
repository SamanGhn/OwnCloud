---

## 📄 `README.md`
```markdown
# OwnCloud DevOps Setup

This project provides a complete environment to run **OwnCloud** with MariaDB and Redis, featuring:
- Docker Compose configuration
- Custom OwnCloud Docker image build
- CI/CD pipeline via **GitHub Actions** for building and pushing to Docker Hub
- Easy execution in both local and production environments

---

## 🗂 Project Structure
```
.
├── .env                        # Environment variables
├── docker-compose.yml          # Service definitions
├── Dockerfile                  # Custom OwnCloud image build
├── .github/
│   └── workflows/
│       └── docker-build.yml    # GitHub Actions workflow for CI/CD
└── README.md
```

---

## ⚙ Prerequisites
- **Docker** and **Docker Compose**
- Docker Hub account
- GitHub repository connected to Docker Hub

---

## 🔧 Environment Setup
1. Edit `.env` with your desired configuration:
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
   ADMIN_PASSWORD=AdminSuperSecret
   DOCKER_USER=samanuser
   ```

2. Make sure `DOCKER_USER` and `DOCKER_PASS` are added as GitHub Secrets in your repository.

---

## ▶ Local Run
```bash
docker compose --env-file .env up -d
```
Access: `http://localhost:8080`

---

## 🚀 CI/CD Workflow
### Process:
1. Push to the `main` branch.
2. GitHub Actions will:
   - Build the custom OwnCloud image based on the `Dockerfile`
   - Push it to Docker Hub with `latest` and commit hash tags
3. On the production server:
   ```bash
   docker compose pull
   docker compose up -d
   ```

---

## 📡 Production Notes
- Consider using a separate `docker-compose.prod.yml` for SSL and reverse proxy (e.g., Traefik or Nginx).
- Monitoring and logging with Prometheus/Grafana/Loki is recommended.
- Automated backups should be implemented for the database and files.

---

## 🩺 Healthchecks
Each service has a healthcheck:
- **OwnCloud** → `/usr/bin/healthcheck`
- **MariaDB** → `mysqladmin ping`
- **Redis** → `redis-cli ping`

---

## 📜 License
This project is released under the [MIT License](LICENSE).