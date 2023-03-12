# Download prater genesis config
FROM debian:buster-slim AS builder
RUN apt update && apt upgrade -y && apt install curl -y
RUN curl https://github.com/eth-clients/eth2-networks/raw/master/shared/prater/genesis.ssz -o /opt/genesis.ssz

# Use the latest LTS version of Golang Buster Slim as the base image
FROM prysmaticlabs/prysm-beacon-chain:latest

# Copy shared JWT secret to container
COPY ./jwtsecret /opt/jwtsecret

# Copy prysm config
COPY ./beacon.yaml /opt/config.yaml

# Copy praeter genesis
COPY --from=builder /opt/genesis.ssz /opt/genesis.ssz