# BlockTrekker: BigQuery ETL for Arbitrum Goerli
  - goerli (geth + prysm) and arbitrum nitro goerli testnet containerized services
  - etl scripts for initial ETL into big query
  - todo:
    - service that automates posting blocks to bigquery
    - get better tables
    - k8 cicd
    - dyndns for local cluster or move cluster to gcloud

## Use

0. built for debian, requires docker & python3 installed locally
1. build and start Goerli L1 and Arbitrum Goerli L2: `docker compose up --build -d`
  * praeter, goerli, and arbitrum goerli all must sync which takes time
  * don't forget to run `docker compose down` when you're done with the services
  * you can watch logs from the "cluster" with `docker compose logs -ft`
2. ETL arbitrum goerli block/ tx data to bigquery: `@todo`

## Credentials

1. Generate JWT shared secret key before deployment: `openssl rand -hex 32 | tr -d "\n" > "./credentials.jwtsecret"`

2. Copy in a bigquery api credential as `./credentials.gcloud.json`