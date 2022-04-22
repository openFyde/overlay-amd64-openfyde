# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

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
}
