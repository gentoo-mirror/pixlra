# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils cmake

DESCRIPTION="debug_assert is a simple, C++11, header-only library that provides a very flexible DEBUG_ASSERT() macro."
HOMEPAGE="https://github.com/foonathan/debug_assert"
SRC_URI="https://github.com/foonathan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="ZLIB"

SLOT=0
KEYWORDS="~amd64"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
