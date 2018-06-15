# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils

DESCRIPTION="Calyp is an open-source QT based raw video player"
HOMEPAGE="https://github.com/pixlra/calyp"
SRC_URI="https://github.com/pixlra/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT=0
KEYWORDS="~amd64"

X86_CPU_FEATURES="cpu_flags_x86_sse"
IUSE="+qt5 ffmpeg opencv -static-libs $X86_CPU_FEATURES"

DEPEND="
	qt5? (
		dev-qt/qtconcurrent:5
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtprintsupport:5
		dev-qt/qtwidgets:5
	)
	ffmpeg? ( virtual/ffmpeg )
	opencv? ( media-libs/opencv )
"

RDEPEND="
	!media-video/playuver
	${DEPEND}
"

src_configure() {
	local mycmakeargs=(
		-DUSE_SSE=$(usex cpu_flags_x86_sse)
		-DUSE_FFMPEG=$(usex ffmpeg)
		-DUSE_OPENCV=$(usex opencv)
		-DUSE_STATIC=$(usex static-libs)
	)
	cmake-utils_src_configure
}
