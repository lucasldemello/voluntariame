#!/usr/bin/env bash

## Precompile assets
#bundle exec rake assets:precompile

# Check and install gems
bundle install

# If the database exists, migrate. Otherwise setup (create and migrate)
#echo "MySQL database has been created & migrated!"

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

#service memcached start

FILE=.env
if test -f "$FILE"; then
    export $(grep -v '^#' .env | xargs)
fi

# Run the Rails server
bundle exec rails server -b 0.0.0.0 -p 3000