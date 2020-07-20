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

## Releasing a new version
1. Decide on a new version number. We use [semantic versioning](https://semver.org/).
1. Look through all merged PRs since the last release and write release notes as a list of Features,
Bug Fixes,and Other.
1. Once CI has finished and passed on the most recent merge to the default branch,
in the github web UI go to "Releases" and tag a new release with the right version number and the
release notes you have prepared.
1. Update `yul-dc-camerata` with the new version of the postgres image and submit a PR.
