#!/bin/sh

chroot="kiosk"

ltsp-build-client \
    --arch i386 \
    --skipimage \
    --purge-chroot \
    --chroot $chroot \
    --mirror http://localhost:3142/ch.archive.ubuntu.com/ubuntu/ \
    --fat-client \
    --fat-client-desktop ubuntu-desktop 
    --config etc/ltsp/ltsp-build.conf

