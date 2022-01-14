#!/bin/sh

echo "running postfix-init"

if ! [ -z "$POSTFIX_MYHOSTNAME" ]; then
	echo "setting myhostname"
	postconf -e "myhostname = $POSTFIX_MYHOSTNAME"
fi

# configure logging to stdout per
# <http://www.postfix.org/MAILLOG_README.html>.
postconf -e 'maillog_file = /dev/stdout'

# the postfix systemd unit runs aliasesdb as an ExecStartPre
# script, so we should probably run it here.
/usr/libexec/postfix/aliasesdb

exec "$@"
