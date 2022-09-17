# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..11} )

inherit distutils-r1

DESCRIPTION="Automatic GUI generation for easy dataset editing and display"
HOMEPAGE="https://github.com/PierreRaybaut/guidata"
SRC_URI="https://github.com/PierreRaybaut/guidata/archive/refs/tags/v${PV}/${P}.tar.gz"
LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/QtPy[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"
