#!/bin/sh

if [ -z "$LTSP_FATCLIENT" ]; then
  wine $(/usr/share/bin/wine-path)/blitzrechnen/blitzrechnen.exe
else
  ltsp-localapps wine $(/usr/share/bin/wine-path)/blitzrechnen/blitzrechnen.exe
fi

exit
