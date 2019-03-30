#!/bin/sh

debdir=/mnt/sda1/debian_armel

#mkdir -p $debdir/proc $debdir/sys $debdir/dev $debdir/dev/pts $debdir/tmp $debdir/lib/modules/`uname -r`
mkdir -p $debdir/proc $debdir/sys $debdir/dev $debdir/dev/pts $debdir/tmp $debdir/mnt/cloud-ap

cat /etc/mtab > $debdir/etc/fstab

# ----------------------------------------------------------------------

#chmod -R 755 $debdir

chmod -R 700 $debdir/etc/ssh

rm -rf $debdir/run/screen/*

# ----------------------------------------------------------------------

mount -t devpts none  $debdir/dev/pts

mount -o bind   /     $debdir/mnt/cloud-ap
mount -o bind   /dev  $debdir/dev
mount -o bind   /proc $debdir/proc
mount -o bind   /sys  $debdir/sys
mount -o bind   /tmp  $debdir/tmp

#mount -o bind   /lib/modules/`uname -r`  $debdir/lib/modules/`uname -r`

mount -o bind /mnt/sda1/dd-wrt/usr/local /usr/local
mount -o bind /mnt/sda1/dd-wrt/bin/ipkg  /bin/ipkg
mount -o bind /mnt/sda1/dd-wrt/jffs      /jffs

cp -rf /lib/modules  $debdir/lib/

# ----------------------------------------------------------------------

nohup /bin/busybox chroot $debdir $* &

exit $?

