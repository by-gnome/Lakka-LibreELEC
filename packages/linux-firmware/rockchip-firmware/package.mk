# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rockchip-firmware"
PKG_VERSION="firmware"
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/rockchip-linux"
PKG_URL=""
PKG_DEPENDS_TARGET="rkbin rfkill"
PKG_LONGDESC="rockchip firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  FW_TARGET_DIR="$PKG_BUILD/.install-firmware"
  
  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/libreelec

  mkdir -p $INSTALL/usr/bin
    cp -v $(get_build_dir rkbin)/firmware/bin/rtk_hciattach $INSTALL/usr/bin

  mkdir -p $FW_TARGET_DIR/rtlbt
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/rtl8723b_* $FW_TARGET_DIR/rtlbt

  mkdir -p $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4345C0.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4345C5.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/bcm4354a1.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4354A2.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4356A2.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/bluetooth/BCM4359C0.hcd $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm43455c0_ag.bin $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm43456c5_ag.bin $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm4354a1_ag.bin $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm4356a2_ag.bin $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/fw_bcm4359c0_ag.bin $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6255.txt $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6256.txt $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6354.txt $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6356.txt $FW_TARGET_DIR/brcm
    cp -v $(get_build_dir rkbin)/firmware/wifi/nvram_ap6398s.txt $FW_TARGET_DIR/brcm

  mkdir -p $FW_TARGET_DIR/rockchip
    cp -v $(get_build_dir rkbin)/firmware/rockchip/dptx.bin $FW_TARGET_DIR/rockchip
}
