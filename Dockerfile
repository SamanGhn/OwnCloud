FROM owncloud/server:${OWNCLOUD_VERSION}
LABEL maintainer="Saman <your_email@example.com>"

# اگر پلاگین یا تم اضافه داری اینجا کپی کن
# COPY apps/plugin /var/www/html/apps/plugin

EXPOSE 8080
