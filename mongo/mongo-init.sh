#!/bin/bash

# Check if file exists, if so, do not run this script, just delete it
if [[ -f /data/db/configdb/preconfigured ]]; then
    rm -rf /docker-entrypoint-initdb.d/init.sh
    exit 0
fi

# create admin user and app user

mongo -- <<EOF
use admin
db.createUser({user: "${MONGO_INITDB_ROOT_USERNAME}",pwd: "${MONGO_INITDB_ROOT_PASSWORD}",roles: [{ role: "userAdminAnyDatabase", db: "admin"},{ role: "dbAdminAnyDatabase", db: "admin"},{ role: "readWriteAnyDatabase", db: "admin"},{ role: "root", db: "admin"}]});
EOF

sleep 5

mongo -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} <<EOF
use admin
db.createUser({user: "${MONGO_INITDB_DB_USERNAME}", pwd: "${MONGO_INITDB_DB_PASSWORD}", roles: [{ role: "readWrite", db: "${MONGO_INITDB_DB_NAME}" },{ role: "dbAdmin", db: "${MONGO_INITDB_DB_NAME}" }]});
EOF

# Create file in /data/configdb when this is complete to ensure this script is not re-run if container is deleted
if [[ $? -eq 0 ]]; then
    echo "Creating lock file..."
    touch /data/db/configdb/preconfigured
    echo "Done"
fi

# Delete myself
if [[ $? -eq 0 ]]; then
    echo "Deleting script..."
    rm -rf /docker-entrypoint-initdb.d/mongo-init.sh
    echo "Done"
fi