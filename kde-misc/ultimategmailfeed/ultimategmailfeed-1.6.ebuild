# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde5

DESCRIPTION="Plasma 5 applet providing a list of unread emails from your Gmail inbox"
HOMEPAGE="https://store.kde.org/p/1248550/ https://github.com/intika/ultimategmailfeed"
SRC_URI="https://github.com/intika/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep plasma)
	$(add_qt_dep qtdeclarative 'xml')
	$(add_qt_dep qtnetwork)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols)
"
