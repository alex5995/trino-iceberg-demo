# %%
from pyiceberg.catalog import load_catalog
from pyiceberg.expressions import GreaterThanOrEqual

catalog = load_catalog(
    name="default",
    **{
        "uri": "thrift://localhost:9083",
        "s3.endpoint": "http://localhost:9000",
        "s3.access-key-id": "admin",
        "s3.secret-access-key": "password",
    }
)

# %%
catalog.list_namespaces()

# %%
catalog.list_tables("nyc")

# %%
table = catalog.load_table("nyc.taxis")
con = table.scan(
    row_filter=GreaterThanOrEqual("trip_distance", 2),
    selected_fields=("vendor_id", "trip_id", "trip_distance"),
).to_duckdb(table_name="taxis")
con.execute("SELECT * FROM taxis").df()
