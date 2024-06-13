# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="Commitizen is release management tool designed for teams"
HOMEPAGE="https://github.com/commitizen-tools/commitizen"
SRC_URI="https://github.com/commitizen-tools/commitizen/archive/refs/tags/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="1"

RDEPEND=""

RDEPEND="
	>=dev-vcs/git-1.8.5.2
	${DEPEND}
"
