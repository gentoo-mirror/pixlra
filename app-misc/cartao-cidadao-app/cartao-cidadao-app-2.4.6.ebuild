# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker

DESCRIPTION="Middleware do Cartao de Cidadao"
HOMEPAGE="https://www.cartaodecidadao.pt"
LICENSE="Licence-Cartao-Cidadao-App"

SRC_URI="https://www.autenticacao.gov.pt/documents/10179/11962/pteid-mw_ubuntu14_amd64.deb/e89b6245-7195-46f3-8635-d703ff9c02f6"

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
