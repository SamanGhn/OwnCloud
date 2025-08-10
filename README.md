Here’s a clean **README.md** draft in English that explains the `.env.example` format and how to configure it after deployment:  

---

# OwnCloud Docker Setup

This repository contains a **secure and production-ready** Docker Compose configuration for running **OwnCloud** with **MariaDB** and **Redis**.  
Passwords and sensitive data are **not** stored in the repository — instead, they are managed via an `.env` file.

---

## 📦 How It Works
- `docker-compose.yml` – Docker Compose setup for OwnCloud, MariaDB, and Redis.  
- `.env.example` – Template for environment variables **without sensitive data**.  
- `.env` – Your real secrets and configuration values (this file should **never** be committed to Git).  
- `.gitignore` – Ensures `.env` stays private.

---

## 🚀 Quick Start

1. **Clone this repository** to your server:
   ```bash
   git clone https://github.com/USERNAME/owncloud-docker.git
   cd owncloud-docker
   ```

2. **Copy the environment template** to create your real `.env`:
   ```bash
   cp .env.example .env
   ```

3. **Edit `.env`** and set:
   - Admin username & password
   - Database name & credentials
   - OwnCloud domain and trusted domains
   - Custom port (optional)

   Example:
   ```env
   ADMIN_USERNAME=myadmin
   ADMIN_PASSWORD=StrongP@ssword!
   OWNCLOUD_DB_PASSWORD=MySecureDbPass
   MYSQL_ROOT_PASSWORD=AnotherStrongPass
   ```

4. **Start OwnCloud**:
   ```bash
   docker compose up -d
   ```

5. **Access**:
   - Open `http://your-server:8080` in your browser.

---

## 🔐 Security Notes
- Never commit your real `.env` to GitHub — the `.gitignore` in this repo already prevents this.
- Choose strong, unique passwords.
- Change the default ports or use a reverse proxy with HTTPS if hosting publicly.
- Keep images updated:
  ```bash
  docker compose pull
  docker compose up -d
  ```

---

## 📄 License
This project is released under the MIT License.

---

If you want, I can also add a **"Usage with Nginx Reverse Proxy & SSL"** section here so people can deploy it securely on a public server. You want me to include that?