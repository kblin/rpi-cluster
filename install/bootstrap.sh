#!/bin/bash
# Bootstrap an ArchLinuxArm RPi2 system by name

set -o errexit
set -o nounset

if [ $# -lt 1 ]; then
    echo "Usage: $0 TARGET"
    exit 2
fi

NAME="$1"
BACKUP_DIR="$(dirname $0)/${NAME}/backup"
TARGET_DIR="$(dirname $0)/root"


echo "Restoring configuration for system ${NAME} if available"
if [ -d "${BACKUP_DIR}" ]; then
    set -x
    cp -r "${BACKUP_DIR}/root/.ssh" "${TARGET_DIR}/root/"
    cp "${BACKUP_DIR}/etc/hostname" "${TARGET_DIR}/etc/"
    cp "${BACKUP_DIR}/etc/ssh/ssh_host"* "${TARGET_DIR}/etc/ssh/"
    cp "${BACKUP_DIR}/etc/systemd/network/eth0.network" "${TARGET_DIR}/etc/systemd/network/"
    set +x
fi

echo "Done. Remember to unmount the SD card."
