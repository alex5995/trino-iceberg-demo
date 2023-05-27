{{
  config(
    materialized='table',
    properties= {
      "format": "'PARQUET'",
      "partitioning": "ARRAY['vendor_id']",
    }
  )
}}

SELECT
	t.vendor_id,
	t.trip_id,
	c.city,
	m.month,
	y.year
FROM datalake.nyc.taxis AS t
LEFT JOIN pg.public.cities AS c
	ON t.vendor_id = c.id
LEFT JOIN sheets.default.months AS m
	ON t.vendor_id = CAST(m.id AS BIGINT)
LEFT JOIN sheets.default.years AS y
	ON t.vendor_id = CAST(y.id AS BIGINT)
