# Copyright (c) 2021, Fyde Innovations Limited. All rights reserved.
# Distributed under the license specified in the root directory of this project.

# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

SCM=""
if [ "${PV%9999}" != "${PV}" ] ; then # Live ebuild
	SCM=git-r3
	EGIT_BRANCH=master
	EGIT_REPO_URI="https://github.com/intel/libva"
fi

AUTOTOOLS_AUTORECONF="yes"
inherit autotools-multilib ${SCM} multilib

DESCRIPTION="Video Acceleration (VA) API for Linux"
HOMEPAGE="https://01.org/linuxmedia/vaapi"
if [ "${PV%9999}" != "${PV}" ] ; then # Live ebuild
	SRC_URI=""
	S="${WORKDIR}/${PN}"
else
	SRC_URI="https://github.com/intel/libva/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
if [ "${PV%9999}" = "${PV}" ] ; then
	KEYWORDS="*"
else
	KEYWORDS=""
fi
IUSE="+drm egl opengl vdpau wayland X utils"
REQUIRED_USE="|| ( drm wayland X )"

VIDEO_CARDS="amdgpu fglrx intel i965 iHD nouveau nvidia"
for x in ${VIDEO_CARDS}; do
	IUSE+=" video_cards_${x}"
done

# Chromium: remove versions in X dependencies to accomodate older ones
RDEPEND=">=x11-libs/libdrm-2.4.46
	X? (
		x11-libs/libX11
		x11-libs/libXext
		x11-libs/libXfixes
	)
	opengl? ( >=virtual/opengl-7.0-r1 )
	wayland? ( >=dev-libs/wayland-1.0.6 )
	"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

# Chromium: remove video_cards_nouveau to libva-vdpau-driver dependency
# as this library is not present in Chromium OS.
PDEPEND="video_cards_nvidia? ( >=x11-libs/libva-vdpau-driver-0.7.4-r1 )
	vdpau? ( >=x11-libs/libva-vdpau-driver-0.7.4-r1 )
	video_cards_amdgpu? ( media-libs/mesa )
	video_cards_fglrx? (
		|| ( >=x11-drivers/ati-drivers-14.12-r3
			>=x11-libs/xvba-video-0.8.0-r1 )
		)
	video_cards_iHD? ( ~x11-libs/libva-intel-media-driver-18.4.1 )
	video_cards_intel? ( !video_cards_iHD? ( ~x11-libs/libva-intel-driver-2.3.0 ) )
	video_cards_i965? ( ~x11-libs/libva-intel-driver-2.3.0 )
	utils? ( media-video/libva-utils )"

REQUIRED_USE="|| ( drm wayland X )
		opengl? ( X )"

DOCS=( NEWS )

MULTILIB_WRAPPED_HEADERS=(
/usr/include/va/va_backend_glx.h
/usr/include/va/va_x11.h
/usr/include/va/va_dri2.h
/usr/include/va/va_dricommon.h
/usr/include/va/va_glx.h
)

src_prepare() {
	# After this https://github.com/intel/libva/pull/245 is merged
	# below patch will not be needed
	use video_cards_iHD && epatch "${FILESDIR}"/0001-Replace-i965-with-iHD-driver.patch
	epatch "${FILESDIR}"/0002-Add-return-value-into-logs.patch

	autotools-utils_src_prepare
}

multilib_src_configure() {
	local myeconfargs=(
		--with-drivers-path="${EPREFIX}/usr/$(get_libdir)/va/drivers"
		--includedir="${EPREFIX}/usr/include"
		$(use_enable opengl glx)
		$(use_enable X x11)
		$(use_enable wayland)
		$(use_enable drm)
	)
	autotools-utils_src_configure
}
