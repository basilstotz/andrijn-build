#!/bin/sh



if [ $# -ne 2 ]; then
  echo 
  echo "Usage: $(basename $0) \"<winecontainer>\" \"/path/to/app.exe>\" "
  echo 
  echo "       example:" 
  echo "       $(basename $0) \"Blitzrechnen\" \"Klett/Blitzrechnen/Blitzrechnen.exe\" "
  echo 
  exit 1
fi

WINE_PATH="/usr/share/prop"

if test -f /etc/default/prop; then
  . /etc/default/prop
fi
 

MASTERPREFIX=${WINE_PATH}/$1"
EXEPATH="$2"

if ! [ -d "${MASTERPREFIX}/drive_c/Program Files" ]; then
  echo
  echo "Error: '${MASTERPREFIX}' looks not like a wine-container. Exiting..."
  echo 
  exit 1
fi

WINEPREFIX="${HOME}/.$(basename "${MASTERPREFIX}")"
#                   ^ here is a point!!!!!!!!

# remove WINEPREFIX if newer version exists
if [ -d "$WINEPREFIX" ]; then
   if [ "$MASTERPREFIX" -nt "$WINEPREFIX" ];  then
     echo -n "A newer app exists. Removing old..."
     rm -rf "$WINEPREFIX"
     echo "OK"
   else
     echo "The app is the newest version. OK"
   fi
fi

#rm -rf "$WINEPREFIX"

# install WINEPREFIX if missing

if ! [ -d "$WINEPREFIX" ]; then

  # create and populate WINWPREFIX

  echo -n "App does not exist. Installing..."
  mkdir -p "$WINEPREFIX"
  lndir "$MASTERPREFIX" "$WINEPREFIX"
  echo "OK"
  
  # empty profiles

  PROFILES="${WINEPREFIX}/drive_c/windows/profiles"
  if [ -d "$PROFILES" ]; then
    rm -r "$PROFILES"
  fi
  mkdir  "$PROFILES"
 
  # remove user.reg if it exists

  if [ -h "${WINEPREFIX}/user.reg" ]; then rm "${WINEPREFIX}/user.reg"; fi 

  # copy read/write files
  #                                 system.reg
  for FILE in .no_prelaunch_window_flag system.reg userdef.reg; do
    echo "${WINEPREFIX}/${FILE}"
    if [ -h "${WINEPREFIX}/${FILE}" ]; then
       rm -f "${WINEPREFIX}/${FILE}"
       cp "${MASTERPREFIX}/${FILE}" "${WINEPREFIX}/${FILE}"
    fi
  done

  # change access mode to privat

  chmod -R og-rwx "${WINEPREFIX}"
fi

#start exe

if ! [ "$2" = "install" ]; then

  if [ -n "$LTSP_FATCLIENT" ]; then
     env WINEPREFIX="${WINEPREFIX}" wine "${WINEPREFIX}/drive_c/Program Files/${EXEPATH}"
  else
     ltsp-localapps env WINEPREFIX="${WINEPREFIX}" wine "${WINEPREFIX}/drive_c/Program Files/${EXEPATH}"
  fi  
fi

exit $?
