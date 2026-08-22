CADBase Database
=====

Database and default data for tests.

**⚠️ NOTE:** Synthetic test data only. All names and details are fictional.

## Getting started

```sh
docker-compose up -d
```

## Connection

```bash
# Connect to database
psql -h localhost -p 5432 -U postgres -d postgres

# Reset database (remove volumes and rebuild)
docker-compose down -v && docker-compose up -d --build

# View logs
docker-compose logs -f
```