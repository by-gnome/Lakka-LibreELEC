# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="linux-firmware"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $FIRMWARE"
PKG_SECTION="virtual"
PKG_LONGDESC="linux-firmware is a meta-package to install various free firmware drivers"

makeinstall_target() {
  FW_TARGET_DIR=$INSTALL/$(get_full_firmware_dir)

  for fwpkg in $FIRMWARE; do
    PKG_FW_SOURCE=$(get_build_dir fwpkg)/.install_firmware

    if [ -d "$PKG_FW_SOURCE" ]; then
      cp -aT $PKG_FW_SOURCE $FW_TARGET_DIR
    else
      echo "ERROR: Firmware dir ${PKG_FW_SOURCE} does not exist - aborting"
      exit 1
    fi
  done
  }
