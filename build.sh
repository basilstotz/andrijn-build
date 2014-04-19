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

#exit


mkdir -p /opt/ltsp/$chroot/usr/home
echo 'copy_dirs="$copy_dirs /usr/home"' >> /opt/ltsp/$chroot/etc/default/ltsp-client-setup  

sed "s/^DHOME=.*$/DHOME=\/usr\/home\//" -i /opt/ltsp/$chroot/etc/adduser.conf

chroot /opt/ltsp/$chroot adduser --disabled-password --gecos ,,, autologin


chroot /opt/ltsp/$chroot apt-get install --yes debconf-utils

chroot /opt/ltsp/$chroot debconf-get-selections >pre.selections

#ldap
echo "ldap......................." 
chroot /opt/ltsp/$chroot apt-get install --yes ldap-utils libpam-ldap libnss-ldap nslcd

chroot /opt/ltsp/$chroot update-rc.d nslcd defaults 

chroot /opt/ltsp/$chroot debconf-get-selections >post.selections


if test -f /opt/ltsp/$chroot/etc/nsswitch.conf; then
  sed "s/compat/compat ldap/g" -i /opt/ltsp/$chroot/etc/nsswitch.conf
else
  echo "file not found: /etc/nsswitch.conf"
fi
echo "ok"


ltsp-update-image /opt/ltsp/$chroot/


 