#!/bin/sh
# Alpine's mysql-client is the MariaDB client, which verifies the server's TLS
# certificate by default and fails on MySQL's self-signed one. Craft runs
# mysqldump/mysql with --defaults-file, so a global my.cnf is ignored and the
# flag has to be passed on the command line, right after --defaults-file
# (which must stay the first argument).
case "$(basename "$0")" in
  mysqldump) bin=/usr/bin/mariadb-dump ;;
  *) bin=/usr/bin/mariadb ;;
esac

if [ "${1#--defaults-file=}" != "$1" ]; then
  defaults_file=$1
  shift
  exec "$bin" "$defaults_file" --skip-ssl-verify-server-cert "$@"
fi

exec "$bin" --skip-ssl-verify-server-cert "$@"
