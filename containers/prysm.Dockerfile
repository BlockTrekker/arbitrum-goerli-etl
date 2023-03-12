Use the latest LTS version of Golang Buster Slim as the base image
FROM golang:buster-slim

# Copy shared JWT secret to container
COPY ./jwtsecret /opt/jwtsecret

# Install necessary packages
RUN apt-get update && apt-get install -y git curl

# Clone Prysm repo
RUN curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output prysm.sh && \
    chmod +x prysm.sh

# Expose the necessary ports
EXPOSE 13000/tcp

# Run beacon chain using checkpoint sync
CMD [
    "./prysm",
    "--network goerli",
    "--http-web3provider=http://geth:8545"
    "--jwt-secret=/opt/jwtsecret",
    "--checkpoint-sync-url=https://goerli.checkpoint-sync.ethpandaops.io",
    "--genesis-beacon-api-url=https://goerli.checkpoint-sync.ethpandaops.io"
]