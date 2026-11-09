# Factory Test

Rails web application with PostgreSQL, server-rendered views, and Minitest.
Targets Ruby 3.3 and Rails 8.1.4.1. The initial skeleton was generated with locally available Rails 7.1 tooling, then configured for Rails 8.1.

## Development

Install Docker with Compose, then run:

```sh
make build
make up
```

Open http://localhost:3000. Startup prepares the development database automatically.
Source files are mounted into the container for development reloads. No host Ruby or PostgreSQL installation is required.

```sh
make console  # Rails console; requires make up running
make shell    # Container shell; requires make up running
make test     # Prepares a separate test database and runs Minitest
make migrate # Apply migrations
make down    # Stop containers, retaining database and gem volumes
make help
```

Copy `.env.example` to `.env` to customize the host port. PostgreSQL is available internally as `db`; development credentials are configured in `compose.yaml`.

Commit `Gemfile.lock` after the first successful dependency installation. The initial setup could not download dependencies or run containers because the creation environment blocked RubyGems DNS and Docker socket access. Build, boot, database, and test verification remain pending.
