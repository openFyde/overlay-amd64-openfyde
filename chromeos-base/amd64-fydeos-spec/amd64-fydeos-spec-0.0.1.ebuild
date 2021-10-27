# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="5"

inherit appid2

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
  doappid "{6B1266C6-CC06-4EF1-B648-9A0799301D78}" "CHROMEBOOK" "{30D63171-10F9-41AA-9858-2F9913A75C9B}"
  insinto "/usr/share/power_manager/board_specific"
  doins ${FILESDIR}/powerd/*
}
