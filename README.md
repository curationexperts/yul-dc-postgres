# yul-dc-postgres
Postgres image for yul-dc project

* Currently, the only difference between this image and the standard Postgres image is that it creates multiple databases in a single running container.

## Using this image
* In order to use this image, in your Docker-Compose file, put these stanzas under your `services` and `volumes` sections.

```
services:
  db:
    build: .
    image: 'yalelibraryit/dc-postgres:${POSTGRES_VERSION}'
    ports:
      - "5432:5432"
    volumes:
      - "db:/var/lib/postgresql/data"
    environment:
      # This should be a comma delimited list of databases, no spaces
      POSTGRES_MULTIPLE_DATABASES: YOUR_FIRST_DATABASE_NAME,YOUR_SECOND_DATABASE_NAME
      # Currently, the Postgres user and password for both databases must be the same.
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password

volumes:
  db:
```
* You can either include the `POSTGRES_VERSION` in your environment file, or replace it with the Docker tag of your chosen version.
