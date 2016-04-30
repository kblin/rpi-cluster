# RPi Cluster Config & Setup

This repository contains scripts and setups for my RaspberryPi2 cluster.

## Install
Install [ArchLinuxArm](https://archlinuxarm.org/) on a pre-formatted SD card
using the `format.sh` script. This assumes the SD card contains a boot partition
at `/dev/mmcblk0p1` and a system partition at `/dev/mmcblk0p2`. It assumes the
ArchLinuxArm tarball is sitting one directory further up.

The `bootstrap.sh` script can be used to restore SSH host keys, `root`'s
authorized keys, hostname and networking settings from a per-host backup.

## License
Unless mentioned otherwise, all code in this repository is under an Apache
version 2 license. See [`LICENSE`](LICENSE) for details.
