# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Function (FN) key monitoring for Toshiba laptops"
HOMEPAGE="http://ktoshiba.sourceforge.net/"
EGIT_REPO_URI="https://github.com/jfmcarreira/ktoshiba.git"
LICENSE="GPL-2"

KEYWORDS=""
IUSE=""

RDEPEND="
	$(add_plasma_dep plasma-workspace)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	net-libs/libmnl
	sys-devel/gettext
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DLIBMNL_INCLUDE_DIRS=/usr/include/libmnl
	)
	kde5_src_configure
}
