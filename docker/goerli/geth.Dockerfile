# Geth client
FROM ethereum/client-go:latest

COPY ./credentials.jwtsecret /opt/jwtsecret
