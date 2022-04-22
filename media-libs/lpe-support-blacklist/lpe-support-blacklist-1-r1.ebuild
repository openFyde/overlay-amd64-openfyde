# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Files used to support/configure LPE Audio"
LICENSE="BSD-Intel"
SLOT="0"

KEYWORDS="*"

S=${WORKDIR}

src_install() {
	insinto /etc/modprobe.d
	doins "${FILESDIR}"/alsa-skl.conf

}
