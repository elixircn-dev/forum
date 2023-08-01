format:
    mix format

setup:
    mix deps.get
    just dev-env up -d
    mix ecto.setup

dev-env +args:
    docker compose -f dev.docker-compose.yml {{args}}

run +args='':
    iex -S mix {{args}}

test:
    mix test
