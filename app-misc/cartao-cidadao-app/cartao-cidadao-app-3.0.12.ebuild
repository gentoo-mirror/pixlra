# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker versionator

DESCRIPTION="Middleware do Cartao de Cidadao"
HOMEPAGE="https://www.cartaodecidadao.pt"
LICENSE="Licence-Cartao-Cidadao-App"

SRC_URI="https://www.autenticacao.gov.pt/documents/10179/11962/pteid-mw_3.0.12_amd64.deb/7bb1bfbf-a3b5-4c90-9e3e-38740dbe504b"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-apps/debianutils"

RDEPEND="
	app-crypt/ccid
	app-text/poppler[qt5]
	dev-libs/openssl
	dev-libs/xerces-c
	dev-libs/xml-security-c
	>=dev-qt/qtcore-5.5.0
	>=dev-qt/qtgui-5.0.2
	>=dev-qt/qtnetwork-5.0.2
	>=dev-qt/qtprintsupport-5.0.2
	>=dev-qt/qtwidgets-5.2.0
	media-libs/jasper
	net-misc/curl
	sys-apps/pcsc-lite
	sys-apps/pcsc-tools
	virtual/jre
"

S="${WORKDIR}"
DESTDIR="${D}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
