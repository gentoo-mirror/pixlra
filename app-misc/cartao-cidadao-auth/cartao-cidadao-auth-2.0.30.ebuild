# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker versionator

DESCRIPTION="Autenticacao do Cartao de Cidadao em java"
HOMEPAGE="https://www.cartaodecidadao.pt"
LICENSE="Licence-Cartao-Cidadao-App"

SRC_URI="https://autenticacao.gov.pt/fa/ajuda/software/plugin-autenticacao-gov.deb"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-crypt/ccid
	sys-apps/pcsc-lite
	sys-apps/pcsc-tools
	virtual/jre
"

RDEPEND="${DEPEND}"

S="${WORKDIR}"
DESTDIR="${D}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
