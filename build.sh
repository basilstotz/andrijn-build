#!/bin/sh

chroot="kiosk"

#ltsp-build-client \
echo \
    --purge-chroot \
    --chroot "$chroot" \
    --mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
    --updates-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
    --security-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
    --skip-upgrade \
    --arch i386 \
    --skipimage \
    --update-sshkeys \
    --install-debs-dir "/etc/ltsp/debs" \
    --debconf-seeds "/etc/ltsp/debconf.seeds" \
    --andrijn-update "http://172.16.42.10/ltsp-images" \
    --set-lts-conf \
    --ldap-auth \
    --copy-tftpboot \
    --terminal-server \
    --fat-client \
    --fat-client-desktop "ubuntu-desktop" \
    --ldm-themes-extra \
    --custom-launcher \
    --language-support-german \
    --multiuser-wine \
    --package-lists "debug.list" | tee build.log


