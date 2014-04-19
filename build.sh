#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --arch i386 \
    --skipimage \
    --purge-chroot \
    --chroot $chroot \
    --mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --fat-client \
    --fat-client-desktop ubuntu-desktop \
    --config ./etc/ltsp/empty.conf
    --debconf-seeds ./etc/ltsp/debconf.seeds \
    --late-packages "language-pack-de language-pack-gnome-de \ 
                     language-pack-kde-de hyphen-de libreoffice-I10n-de \
                     myspell-de-ch mythes-de-ch emacs nmap xosview"
