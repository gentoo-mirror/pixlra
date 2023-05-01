# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker desktop xdg

ORIGINAL_PN="pteid-mw"
APP="eidguiV2"
CC_HOME="opt/${PN}"
DESCRIPTION="See and change information on your Portuguese eID Card"
HOMEPAGE="https://www.autenticacao.gov.pt/cc-aplicacao"

SRC_URI="https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw_ubuntu22_amd64.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	sys-apps/pcsc-tools
	app-crypt/ccid
	sys-libs/glibc
	net-misc/curl
	sys-devel/gcc
	app-text/poppler[qt5,jpeg2k,png]
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtwidgets:5
	>=dev-libs/openssl-1.1.0
	dev-libs/xerces-c
	>=dev-libs/xml-security-c-2.0.0
	dev-libs/libzip
"

QA_PREBUILT="/usr/bin/* /usr/lib64/*"
QA_PRESTRIPPED="/usr/bin/* /usr/lib64/*"

S="${WORKDIR}/"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	# Rename docs directory to our needs.
	mv usr/share/doc/{${ORIGINAL_PN},${PF}}/ || die

	# Decompress the docs.
	gunzip usr/share/doc/${PF}/changelog.gz || die

	# Move folders to the right place
	cp -r usr/local/{bin,include,lib} usr/ || die
	rm -r usr/local/{bin,include,lib} || die
	mv usr/lib usr/lib64

	eapply_user
}

src_install() {
	insinto /usr
	doins -r usr/bin usr/include usr/local usr/lib64 usr/share

	exeinto /usr/bin/
	doexe usr/bin/${APP}
}
