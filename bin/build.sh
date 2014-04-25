#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --purge-chroot \
    --chroot "$chroot" \
    --skip-upgrade \
    --arch i386 \
    --skipimage \
    --update-sshkeys \
    --install-debs-dir "/etc/ltsp/debs" \
    --debconf-seeds "/etc/ltsp/preseeds/debconf.seeds" \
    --andrijn-update "http://172.16.42.1/ltsp-images" \
    --set-lts-conf \
    --ldap-auth \
    --terminal-server \
    --multiuser-wine \
    --fat-client \
    --fat-client-desktop "ubuntu-desktop" \
    --multimedia \
    --calibri-font \
    --ldm-themes-extra \
    --propietary-apps \
    --custom-launcher \
    --language-support-german \
    --package-lists "debug.list edu.list standard.list"  | tee build.log


#     --mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --updates-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --security-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \

