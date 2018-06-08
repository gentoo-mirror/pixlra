# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils cmake-utils flag-o-matic

DESCRIPTION="Lets you easily share a single mouse and keyboard between multiple computers"
HOMEPAGE="https://github.com/debauchee/barrier"
SRC_URI="
	https://github.com/debauchee/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libressl qt5"
RESTRICT="test"

COMMON_DEPEND="
	!libressl? ( dev-libs/openssl:* )
	libressl? ( dev-libs/libressl )
	net-misc/curl
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXtst
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		net-dns/avahi[mdnsresponder-compat]
	)
"
DEPEND="
	${COMMON_DEPEND}
	x11-proto/kbproto
	x11-proto/randrproto
	x11-proto/xextproto
	x11-proto/xineramaproto
	x11-proto/xproto
"
src_configure() {
	local mycmakeargs=(
		-DBARRIER_BUILD_INSTALLER=OFF
		-DBARRIER_BUILD_GUI=$(usex qt5)
	)
	cmake-utils_src_configure
}

src_install () {

# 	insinto /etc
# 	newins doc/${PN}.conf.example ${PN}.conf

	doman doc/${PN}c.1
	doman doc/${PN}s.1

	dodoc doc/${PN}.conf.example* ChangeLog
}
