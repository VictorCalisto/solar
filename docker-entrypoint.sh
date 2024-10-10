#!/bin/bash
set -euvxo pipefail
IFS=$'\n\t'
# Remove PID
rm -rf /artemis2/tmp/pids/server.pid
exec "$@"