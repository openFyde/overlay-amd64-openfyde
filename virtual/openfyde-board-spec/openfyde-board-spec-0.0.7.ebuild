# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="4"

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="kernel-5_10"

RDEPEND="
    chromeos-base/auto-expand-partition
	chromeos-base/apple-touchpad-bcm5974
    chromeos-base/amd64-openfyde-spec
    sys-firmware/mssl1680-firmware
    sys-apps/haveged
    chromeos-base/fydeos-gestures-config
    media-libs/lpe-support-topology
    chromeos-base/intel-lpe-audio-config
    virtual/fydemina
    chromeos-base/flash_player
    chromeos-base/fydeos-input-util
    !kernel-5_10? (
      net-wireless/rtl8821ce-driver
      net-wireless/broadcom-sta
    )
    chromeos-base/vga-switcher
    virtual/gentoo-extra-pkgs
"

#    chromeos-base/intel-microcode
#    sys-firmware/b43-firmware
#    chromeos-base/common-usb-camera-config
#    net-wireless/broadcom-sta

DEPEND="${RDEPEND}"
