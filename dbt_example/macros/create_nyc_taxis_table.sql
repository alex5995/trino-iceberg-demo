{% macro create_nyc_taxis_table() %}

    {% set query %}

        CREATE SCHEMA datalake.nyc
        ;

        CREATE TABLE datalake.nyc.taxis (
            vendor_id BIGINT,
            trip_id BIGINT,
            trip_distance REAL,
            fare_amount DOUBLE,
            store_and_fwd_flag VARCHAR
        ) WITH (
            partitioning = ARRAY['vendor_id']
        )
        ;

        INSERT INTO datalake.nyc.taxis
        VALUES
            (1, 1000371, 1.8, 15.32, 'N'),
            (2, 1000372, 2.5, 22.15, 'N'),
            (2, 1000373, 0.9, 9.01, 'N'),
            (1, 1000374, 8.4, 42.13, 'Y')
        ;

    {% endset %}

    {% do run_query(query) %}

{% endmacro %}