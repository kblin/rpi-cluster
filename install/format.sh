#!/bin/bash
# Format pre-formatted RPi2 SD cards at /dev/mmcblk0p{1,2}

set -o errexit
set -o nounset

DIRNAME="$(readlink -f $(dirname $0))"
BOOTDIR="${DIRNAME}/boot"
ROOTDIR="${DIRNAME}/root"
ARCHIVE="$(dirname ${DIRNAME})/ArchLinuxARM-rpi-2-latest.tar.gz"

for m in "/dev/mmcblk0p1" "/dev/mmcblk0p2"; do
    if [ $(mount | grep -q $m) -eq 0 ]; then
        echo "Unmounting $m"
        umount $m;
    fi
done

mkfs.vfat -n boot /dev/mmcblk0p1
mkfs.ext4 -L root /dev/mmcblk0p2

mount /dev/mmcblk0p1 ${BOOTDIR}
mount /dev/mmcblk0p2 ${ROOTDIR}

echo "Extracting base system, this may take a while..."

bsdtar -xpf ${ARCHIVE} -C ${ROOTDIR}
sync
mv ${ROOTDIR}/boot/* ${BOOTDIR}

echo "Done. Next run bootstrap.sh"
