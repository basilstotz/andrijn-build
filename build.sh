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
    --fat-client \
    --fat-client-desktop ubuntu-desktop \
    --debconf-seeds /etc/ltsp/debconf.seeds \
    --andrijn-update "http://172.16.42.10/ltsp-images" \
    --set-etc-lts-conf \
    --ldm-themes-extra \
    --custom-launcher \
    --copy-tftpboot \
    --language-support-german \
    --ldap-auth \
    --multiuser-wine \
    --package-lists "debug.list" | tee build.log

