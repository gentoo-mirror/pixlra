# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="btrfs-snap creates and maintains the history of snapshots of btrfs filesystems"
HOMEPAGE="https://github.com/jf647/btrfs-snap"
SRC_URI="https://github.com/jf647/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

COMMON_DEPEND="
	sys-fs/btrfs-progs
"

RDEPEND="${COMMON_DEPEND}"

src_install() {
	insinto /usr/bin/

	exeinto /usr/bin/
	doexe ${PN}
}
