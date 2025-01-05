#!/bin/bash
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d "$SERVICE_DB"  <<-EOSQL

/** ------- Publication ------- */

CREATE ROLE $REPLICA_ID WITH LOGIN REPLICATION PASSWORD '$REPLICA_PW';
GRANT connect, temporary ON DATABASE $SERVICE_DB to $REPLICA_ID;
GRANT usage ON SCHEMA $SERVICE_SCHEMA to $REPLICA_ID;
GRANT select ON ALL TABLES IN SCHEMA $SERVICE_SCHEMA TO $REPLICA_ID;
ALTER DEFAULT PRIVILEGES IN SCHEMA $SERVICE_SCHEMA GRANT select ON TABLES TO $REPLICA_ID;

CREATE PUBLICATION repl_slot_01 FOR ALL TABLES;
CREATE PUBLICATION repl_slot_02 FOR ALL TABLES;

EOSQL