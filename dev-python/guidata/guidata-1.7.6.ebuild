# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Automatic GUI generation for easy dataset editing and display"
HOMEPAGE="https://github.com/PierreRaybaut/guidata"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/PyQt5[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"
