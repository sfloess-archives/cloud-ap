#!/bin/bash -x

mkdir -p /mnt/admin-ap/etc /mnt/admin-ap/root /mnt/admin-ap/opt

#afuse -s -o nonempty -o allow_other -o mount_template="sshfs -s `whoami`@admin-ap:/%r %m" -o unmount_template="fusermount -u -z %m" /mnt/admin-ap
afuse -s -o nonempty -o allow_other -o mount_template="sshfs -s %r@admin-ap:/home/%r %m" -o unmount_template="fusermount -u -z %m" /home

#afuse -s -o debug -o nonempty -o allow_other -o mount_template="echo sshfs -s    admin-ap:/opt/%r  %m" -o unmount_template="fusermount -u -z %m" /mnt/admin-ap/opt
#afuse -s -o nonempty -o allow_other -o mount_template="sshfs -s    admin-ap:/etc/%r  %m" -o unmount_template="fusermount -u -z %m" /mnt/admin-ap/etc



#sshfs -s -o allow_other,default_permissions          root@admin-ap:/opt/backups     /mnt/admin-ap/backups
#sshfs -s -o allow_other,default_permissions          root@admin-ap:/opt/media       /mnt/admin-ap/media
#sshfs -s -o allow_other,default_permissions          root@admin-ap:/opt/nas         /mnt/admin-ap/nas
#sshfs -s -o allow_other,default_permissions          root@admin-ap:/opt/shared      /mnt/admin-ap/shared

#mount -o bind /mnt/admin-ap/root /root


