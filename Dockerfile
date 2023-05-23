# Use the official PostgreSQL image from the Docker Hub
FROM postgres

# Environment variables for initial configuration
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydatabase

COPY init.sql /docker-entrypoint-initdb.d/
