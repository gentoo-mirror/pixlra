# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils cmake

DESCRIPTION="type_safe provides zero overhead abstractions that use the C++ type system to prevent bugs."
HOMEPAGE="https://github.com/foonathan/type_safe"
SRC_URI="https://github.com/foonathan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT=0
KEYWORDS="~amd64"

IUSE=""

DEPEND="
	dev-cpp/debug_assert
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DTYPE_SAFE_BUILD_TEST_EXAMPLE=OFF # do not build tests
	)
	cmake_src_configure
}
