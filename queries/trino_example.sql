CREATE SCHEMA dwh.nyc
;

CREATE TABLE dwh.nyc.taxis (
  vendor_id BIGINT,
  trip_id BIGINT,
  trip_distance REAL,
  fare_amount DOUBLE,
  store_and_fwd_flag VARCHAR
) WITH (
    partitioning = ARRAY['vendor_id']
)
;

INSERT INTO dwh.nyc.taxis
VALUES
	(1, 1000371, 1.8, 15.32, 'N'),
	(2, 1000372, 2.5, 22.15, 'N'),
	(2, 1000373, 0.9, 9.01, 'N'),
	(1, 1000374, 8.4, 42.13, 'Y')
;

SELECT
	t.vendor_id,
	t.trip_id,
	c.city,
	m.month,
	y.year
FROM dwh.nyc.taxis AS t
LEFT JOIN pg.public.cities AS c
	ON t.vendor_id = c.id
LEFT JOIN sheets.default.months AS m
	ON t.vendor_id = CAST(m.id AS BIGINT)
LEFT JOIN sheets.default.years AS y
	ON t.vendor_id = CAST(y.id AS BIGINT)
;
