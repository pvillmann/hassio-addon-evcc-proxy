#!/bin/sh
set -eu

OPTIONS_FILE="/data/options.json"
EVCC_URL=""

if [ ! -f "$OPTIONS_FILE" ]; then
	echo "Missing options file: $OPTIONS_FILE"
	exit 1
fi

EVCC_URL=$(jq -r '."evcc-url" // empty' "$OPTIONS_FILE")

if [ -z "$EVCC_URL" ]; then
	echo "No evcc-url configured. Set options.evcc-url in add-on configuration."
	exit 1
fi

if ! printf '%s' "$EVCC_URL" | grep -Eq '^https?://[^[:space:]]+$'; then
	echo "Invalid evcc-url '$EVCC_URL'. Expected format: http(s)://host:port"
	exit 1
fi

export EVCC_URL
envsubst '${EVCC_URL}' < /etc/nginx/nginx.conf.gtpl > /etc/nginx/nginx.conf

echo "Starting evcc proxy -> ${EVCC_URL}"
exec nginx -g 'daemon off;'
