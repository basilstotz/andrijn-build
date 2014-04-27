#!/bin/sh

WINE_PATH="/usr/share/prop"

if test -f /etc/default/prop; then
  . /etc/default/prop
fi

if [ -n "$LTSP_FATCLIENT" ]; then
  wine ${WINE_PATH}/$@
else
  ltsp-localapps wine ${WINE_PATH}/$@
fi

exit
