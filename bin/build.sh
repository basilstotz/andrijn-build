#!/bin/sh

chroot="kiosk"

for mntpoint in dev/pts dev proc sys; do
sudo umount -f /opt/ltsp/$chroot/$mntpoint 2>/dev/null \
    || true
done





ltsp-build-client \
    --copy-package-cache \
    --mirror "http://mirror.switch.ch/ftp/ubuntu/" \
    --base "/home/stotz.basil/ltsp" \
    --purge-chroot \
    --arch i386 \
    --skipimage \
    --update-sshkeys \
    --install-debs-dir "/etc/ltsp/debs" \
    --debconf-seeds "/etc/ltsp/preseeds/debconf.seeds" \
    --andrijn-update "http://172.16.42.1/ltsp-images" \
    --ldap-auth \
    --terminal-server \
    --fat-client \
    --fat-client-desktop "ubuntu-desktop" \
    --language-support-german \
    --multimedia \
    --package-lists "debug.list edu.list standard.list"  | tee build.log


#     --mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --updates-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --security-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --propietary-apps \
#    --ldm-themes-extra \
#    --calibri-font \
#    --andrijn-set-lts-conf \
