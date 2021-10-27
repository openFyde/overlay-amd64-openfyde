#!/bin/bash
/mnt/host/source/src/scripts/build_image --board=amd64-fydeos --adjust_part='ROOT-A:+1G' --noenable_rootfs_verification test
