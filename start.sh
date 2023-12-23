#!/usr/bin/env bash
set -eu

if [ ! -e /app/data/config.json ]; then
    echo "=> Creating initial template on first run"
	cp /app/code/config.json.template /app/data/config.json
fi

# these cannot be changed by user (https://actualbudget.org/docs/config/). env vars take precedence over config.json
export ACTUAL_CONFIG_PATH=/app/data/config.json
export ACTUAL_SERVER_FILES=/app/data/server-files
export ACTUAL_USER_FILES=/app/data/user-files

# ensure that data directory is owned by 'cloudron' user
echo "=> Changing permissions"
chown -R cloudron:cloudron /app/data

# run the app as user 'cloudron'
echo "=> Starting Actual Server"
exec /usr/local/bin/gosu cloudron:cloudron node /app/code/app.js