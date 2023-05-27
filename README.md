## Before starting

To setup this project you need:
- aws-cli
- direnv
- docker
- pyenv

## Get Google Sheets credentials

Follow [this tutorial](https://trino.io/docs/current/connector/googlesheets.html#credentials) to get your `google-sheets-credentials.json` file and place it under the `catalog` folder.

## Create Google Sheets

Create one Google Sheet with two sheets named `months` and `years`. Insert the data from `sheets/calendar_months.csv` and `sheets/calendar_years.csv` in the two sheets.

Then create another Google Sheet with one sheet named `tables`. Insert the data from `sheets/metadata_tables.csv` in the `tables` sheet.
Now replace `gsheet-metadata-id` and `gsheet-calendar-id` with the actual ids in the `tables` sheet.

Finally replace `gsheet-metadata-id` with the actual id in the `catalog/sheets.properties` file.

## Setup docker containers

Execute `docker compose up -d minio`. Then run
```
AWS_ACCESS_KEY_ID=minio \
AWS_SECRET_ACCESS_KEY=minio123 \
aws s3api create-bucket --bucket test \
--endpoint http://localhost:9000
```
to create a bucket.

Finally start all the services with `docker compose up -d`.

## Setup python environment

Run the following commands:
- `pyenv install 3.11.3`
- `direnv allow`
- `pip install -r requirements.txt`

## Execute the dbt project

First of all run `cd dbt_example`.

Then execute `dbt run-operation create_nyc_taxis_table` to create an iceberg table named `taxis` under the `nyc` schema.

Finally launch `dbt run`. This will create an iceberg table named `random_table` and an iceberg view named `random_view` under the `default` schema.

## Play with pyiceberg

The `pyiceberg_example.py` file contains an example about how to use pyiceberg and duckdb to query an iceberg table directly in python.

## Clean the environment

Run the following commands:
- `rm -rf .direnv`
- `docker compose down`
- `docker volume rm trino_minio trino_postgres`
