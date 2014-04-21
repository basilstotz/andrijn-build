#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --purge-chroot \
    --chroot $chroot \
    --mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --updates-mirror http://ch.archive.ubuntu.com/ubuntu/ \
    --security-mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --arch i386 \
    --skipimage \
    --install-debs-dir /etc/ltsp/debs \
    --debconf-seeds /etc/ltsp/debconf.seeds \
    --fat-client \
    --fat-client-desktop ubuntu-desktop \
    --andrijn-update "http://172.16.42.10/ltsp-images" \
    --ldm-themes-extra \
    --copy-tftpboot \
    --language-support-german \
    --ldap-auth \
    --multiuser-wine \
    --late-packages "e3 nmap xosview" | tee build.log
