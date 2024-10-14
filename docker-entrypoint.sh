#!/bin/bash
set +euvxo pipefail
IFS=$'\n\t'

# Remove PID
rm -rf /app/tmp/pids/server.pid

# Compila os Assets
RAILS_ENV=$RAILS_ENV rails assets:{clobber,precompile}

# Inicia o Banco
RAILS_ENV=$RAILS_ENV bundle exec rails db:{drop,create,migrate,seed}

exec "$@"