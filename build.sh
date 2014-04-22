#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --purge-chroot \
    --chroot $chroot \
    --mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --updates-mirror http://ch.archive.ubuntu.com/ubuntu/ \
    --security-mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --skip-upgrade \
    --arch i386 \
    --skipimage \
    --install-debs-dir /etc/ltsp/debs \
    --update-sshkeys \ 
    --debconf-seeds /etc/ltsp/debconf.seeds \
    --andrijn-update "http://172.16.42.10/ltsp-images" \
    --set-etc-lts-conf \
    --ldap-auth \
    --copy-tftpboot \
    --fat-client \
    --fat-client-desktop ubuntu-desktop \
    --ldm-themes-extra \
    --custom-launcher \
    --language-support-german \
    --multiuser-wine \
    --package-lists "debug.list" | tee build.log

