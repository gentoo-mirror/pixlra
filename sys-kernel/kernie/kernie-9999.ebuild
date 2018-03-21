# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Kernie - Kernel Genie, is a Gentoo kernel manager that makes kernel operations easier"
HOMEPAGE="https://github.com/jpataias/kernie"

EGIT_REPO_URI="https://github.com/jpataias/kernie"
EGIT_BRANCH="master"

LICENSE="GPL-3
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	dev-util/dialog
	app-admin/eclean-kernel
"
RDEPEND="${COMMON_DEPEND}"

DISTDDIR=$WORKDIR

src_install() {
    insinto /usr/bin/

    exeinto /usr/bin/
    doexe ${PN}
}
