#!/bin/sh
#winery mspaint install
#ltsp-localapps winery mspaint blitzrechnen/blitzrechnen.exe

if [ -z "$LTSP_CLIENT" ]; then
  wine /home/lehrmittel/blitzrechnen/blitzrechnen.exe
else
#  ltsp-localapps wine /home/lehrmittel/blitzrechnen/blitzrechnen.exe
  ltsp-localapps wine /home/lehrmittel/blitzrechnen/blitzrechnen.exe
fi

exit
