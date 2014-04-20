#!/bin/sh

chroot="kiosk"

if test -d 11089151; then rm -r 11089151;fi
git clone https://gist.github.com/11089151.git

cp 11089151/ltsp-install /opt/ltsp/$chroot/etc/init.d/.
chroot /opt/ltsp/$chroot update-rc.d ltsp-install defaults

if test -d 11089151; then rm -r 11089151;fi


echo "ok"
 