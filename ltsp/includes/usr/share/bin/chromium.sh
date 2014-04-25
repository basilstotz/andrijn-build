#!/bin/sh

WEB_PATH="file:///usr/share/prop"

if test -f /etc/default/prop; then
  . /etc/default/prop
fi

if [ -n "$LTSP_FATCLIENT" ]; then
  chromium --app=${WEB_PATH}/$@
else
  ltsp-localapps chromium --app=${WEB_PATH}/$@
fi

exit
