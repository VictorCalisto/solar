#!/bin/bash
set +euvxo pipefail
IFS=$'\n\t'

# Remove PID
rm -rf /app/tmp/pids/server.pid

# Compila os Assets
rails assets:clobber && rails assets:precompile

# Inicia o Banco
bundle exec rails db:{drop,create,migrate,seed}

exec "$@"