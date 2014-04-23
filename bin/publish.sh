#!/bin/sh

chroot="kiosk"


cd /opt/ltsp/images

if ! test -f $chroot.img;then 
  echo "already published"
  exit 1
fi


VERSION=$(cat version)
if test -z "$VERSION";then VERSION=0;fi

VPLUS=$(( $VERSION + 1))
NAME=$(printf "%06i.img" $VPLUS )

cp $chroot.img $NAME
rm $chroot.img* 
zsyncmake -u $NAME $NAME

rm cur-image-*
touch cur-image-$(printf "%06i" $VPLUS)

echo "$VPLUS" > version

VORNAME=$(printf "%06i" $(( $VERSION - 1 )))

rm ${VORNAME}*
 