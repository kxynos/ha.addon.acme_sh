#!/usr/bin/with-contenv bashio

ACCOUNT=$(bashio::config 'account')
SERVER=$(bashio::config 'server')
DOMAINS=$(bashio::config 'domains')
KEYFILE=$(bashio::config 'keyfile')
CERTFILE=$(bashio::config 'certfile')
ROOTCERTFILE=$(bashio::config 'rootcertfile')

DOMAIN_ARR=()
for domain in $DOMAINS; do
    DOMAIN_ARR+=(--domain "$domain")
done

SERVER_ARG="zerossl"
if [ -n "$SERVER" ]; then
    SERVER_ARG="--server $SERVER"
fi

/root/.acme.sh/acme.sh --issue --standalone  "${DOMAIN_ARR[@]}" \
--ca-bundle "/ssl/${ROOTCERTFILE}" \
--fullchain-file "/ssl/${CERTFILE}" \
--key-file "/ssl/${KEYFILE}" \
$SERVER_ARG 
    
tail -f /dev/null
