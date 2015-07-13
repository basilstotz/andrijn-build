#!/bin/sh

IMG_BASE="/home/stotz.basil/ltsp"
CNF_BASE="/home/stotz.basil/andrijn-build/"


for mntpoint in dev/pts dev proc sys; do
sudo umount -f ${IMG_BASE}/i386/$mntpoint 2>/dev/null \
    || true
done

if ! mount | grep -q "/etc/ltsp/plugins" ; then
   if ! test -d /etc/ltsp/plugins;then mkdir -p /etc/ltsp/plugins;fi
   mount --bind ${CFG_BASE}/plugins /etc/ltsp/plugins
fi


ltsp-build-client \
    --copy-package-cache \
    --keep-packages \
    --mirror "http://mirror.switch.ch/ftp/ubuntu/" \
    --base $IMG_BASE \
    --purge-chroot \
    --arch i386 \
    --skipimage \
    --update-sshkeys \
    --install-debs-dir "${CNF_BASE}/debs" \
    --debconf-seeds "${CNF_BASE}/preseeds/debconf.seeds" \
    --andrijn-update "http://www.amxa.ch/ltsp-images" \
    --ldap-auth \
    --fat-client \
    --fat-client-desktop "ubuntu-desktop" \
    --language-support-german  \
 | tee build.log


if  mount | grep -q "/etc/ltsp/plugins" ; then
      umount  /etc/ltsp/plugins
fi


#    --andrijn-terminal-server \
#    --multimedia \
#    --package-lists "debug.list edu.list standard.list"  | tee build.log


#     --mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --updates-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --security-mirror "http://localhost:3142/ch.archive.ubuntu.com/ubuntu/" \
#    --propietary-apps \
#    --ldm-themes-extra \
#    --calibri-font \
#    --andrijn-set-lts-conf \
