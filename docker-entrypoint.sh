#!/bin/bash
set +euvxo pipefail
IFS=$'\n\t'

# Remove PID
rm -rf /app/tmp/pids/server.pid

# Compila os Assets
rails assets:precompile

exec "$@"