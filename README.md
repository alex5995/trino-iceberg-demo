## Before starting
To setup this project, you need:
- pyenv
- direnv
- aws-cli

## Get Google Sheets credentials

Follow [this tutorial](https://trino.io/docs/current/connector/googlesheets.html#credentials) to get your `google-sheets-credentials.json` file and place it under the `catalog` folder.

## Create Google Sheets

Create one Google Sheet with two sheets named `months` and `years`. Insert the data from `sheets/calendar_months.csv` and `sheets/calendar_years.csv` in the two sheets.

Then create another Google Sheet with one sheet named `tables`. Insert the data from `sheets/metadata_tables.csv` in the `tables` sheet.
Now replace `gsheet-metadata-id` and `gsheet-calendar-id` with the actual ids in the `tables` sheet.

Finally replace `gsheet-metadata-id` with the actual id in the `catalog/sheets.properties` file.

## Setup the project

Execute `docker compose up -d minio`. Then run
```
AWS_ACCESS_KEY_ID=minio \
AWS_SECRET_ACCESS_KEY=minio123 \
aws s3api create-bucket --bucket test \
--endpoint http://localhost:9000
```
to create a bucket.

Finally start all the services with `docker compose up -d`. Now you can play with `queries/trino_example.sql`.

When you have created the `taxis` iceberg table, you can also play with `pyiceberg_example.py`.
