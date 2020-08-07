#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team Lakka (https://lakka.tv)

  [ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
  [ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
  if [ -z "$BOOT_DISK" ]; then
    case $BOOT_PART in
      /dev/sd[a-z][0-9]*)
        BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
        ;;
      /dev/mmcblk*)
        BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
        ;;
    esac
  fi

# mount $BOOT_ROOT r/w
  mount -o remount,rw $BOOT_ROOT

# update Device Tree Blobs
  for all_dtb in /flash/*.dtb; do
    dtb=$(basename $all_dtb)
    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
      echo "*** updating Device Tree Blob: $dtb ..."
      cp -p $SYSTEM_ROOT/usr/share/bootloader/$dtb $BOOT_ROOT
    fi
  done

# update bootloader
  if [ -f $SYSTEM_ROOT/usr/share/bootloader/SPL ]; then
    echo "*** updating u-boot SPL Blob on $BOOT_DISK ..."
    dd if=$SYSTEM_ROOT/usr/share/bootloader/SPL of=$BOOT_DISK bs=1k seek=1 conv=fsync &>/dev/null
  fi

  if [ -f $SYSTEM_ROOT/usr/share/bootloader/u-boot.img ]; then
    echo -n "*** updating u-boot image on $BOOT_DISK ..."
    dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot.img of=$BOOT_DISK bs=1k seek=69 conv=fsync &>/dev/null
    echo "done"
  fi

# mount $BOOT_ROOT r/o
  sync
  mount -o remount,ro $BOOT_ROOT
