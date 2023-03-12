# Use an official Debian Buster slim as a parent image
FROM debian:buster-slim

# Copy shared JWT secret to container
COPY ./jwtsecret /opt/jwtsecret

# Install required dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

# Create a new directory for the geth data
RUN mkdir -p /root/eth-data

# Set the working directory
WORKDIR /root/eth-data

# Start geth with full sync
CMD [
    "geth",
    "--goerli",
    "--syncmode=fast",
    "--cache=4096",
    "--http",
    "--http.api=eth,net,web3"
    "--http.vhosts=\"*\""
    "--http.corsdomain \"*\""
    "--authrpc.jwtsecret=/opt/jwtsecret"
    "console"
]
