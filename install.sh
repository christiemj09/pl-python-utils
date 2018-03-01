#!/bin/bash

# Set up some things to facilitate the use of PL/Python in a PostgreSQL database.

set -e

# Make psql pretty :)
INLINE="psql -U $(cred user) -d $(cred dbname) -h $(cred host) -c"
RUN="psql -U $(cred user) -d $(cred dbname) -h $(cred host) -f"

echo "INLINE is:"
echo $INLINE

echo

echo "RUN is:"
echo $RUN

echo

pause

# Enable PL/Python language
$RUN sql/enable_plpython.sql

# Load setup functions
for f in `ls functions`; do
    $RUN "functions/$f"
done

# Initialize virtualenv table
$RUN sql/virtualenv.sql

# Populate virtualenv table with virtualenvs managed by virtualenvwrapper, if any.
if [ ! -z "$WORKON_HOME" ]; then
    python scripts/populate_virtualenv.py \
            config/populate_virtualenv_from_virtualenvwrapper.json
fi
