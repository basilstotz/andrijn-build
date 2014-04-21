#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --updates-mirror http://ch.archive.ubuntu.com/ubuntu/ \
    --security-mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --arch i386 \
    --skipimage \
    --purge-chroot \
    --chroot $chroot \
    --install-debs-dir /etc/ltsp/debs \
    --debconf-seeds /etc/ltsp/debconf.seeds \
    --fat-client \
    --fat-client-desktop ubuntu-desktop \
    --language-support-german \
    --ldap-auth \
    --multiuser-wine \
    --andrijn-update "http://172.16.42.10/ltsp-images" \
    --ldm-themes-extra \
    --late-packages "e3 nmap xosview" | tee build.log
