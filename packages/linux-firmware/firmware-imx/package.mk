# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="firmware-imx"
PKG_VERSION="8.8"
PKG_SHA256="5ca1f8b6e6b191594d17ac7b51c38cdbc2ff808d15568ab4b0bbeb5dc6c621f6"
PKG_ARCH="arm"
PKG_LICENSE="other"
PKG_SITE="https://www.nxp.com"
PKG_URL="https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/${PKG_NAME}-${PKG_VERSION}.bin"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="NXP iMX firmware such as for the SDMA & VPU"
PKG_TOOLCHAIN="manual"

unpack() {
  cd $(dirname $PKG_BUILD)
  sh $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.bin --auto-accept
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_firmware_dir)/imx/sdma
    cp -P firmware/sdma/sdma-imx6q.bin $INSTALL/$(get_full_firmware_dir)/imx/sdma

  mkdir -p $INSTALL/$(get_full_firmware_dir)
    cp -P firmware/vpu/vpu_fw_imx6d.bin $INSTALL/$(get_full_firmware_dir)
    cp -P firmware/vpu/vpu_fw_imx6q.bin $INSTALL/$(get_full_firmware_dir)

  mkdir -p $BUILD/initramfs/usr/lib/firmware/imx/sdma
    cp -P firmware/sdma/sdma-imx6q.bin $BUILD/initramfs/usr/lib/firmware/imx/sdma
}
