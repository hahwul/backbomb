#!/bin/sh
/etc/init.d/postgresql start
su postgres -c "psql -f /backbomb/postgres.sql"
/usr/bin/zsh
