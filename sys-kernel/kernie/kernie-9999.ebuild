# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Kernie - Kernel Genie, is a Gentoo kernel manager"
HOMEPAGE="https://github.com/jpataias/kernie"

EGIT_REPO_URI="https://github.com/jpataias/kernie"
EGIT_BRANCH="master"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-util/dialog
	app-admin/eclean-kernel
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/bin/

	exeinto /usr/bin/
	doexe ${PN}
}
