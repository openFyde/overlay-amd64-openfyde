# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="4"

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

RDEPEND="
    virtual/openfyde-board-spec
    chromeos-base/device-appid
"

DEPEND="${RDEPEND}"
