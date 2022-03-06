# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker xdg

DESCRIPTION="Autenticacao do Cartao de Cidadao em java"
HOMEPAGE="https://www.cartaodecidadao.pt"
LICENSE="EUPL-1.2"

SRC_URI="https://aplicacoes.autenticacao.gov.pt/plugin/plugin-autenticacao-gov.deb"

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

	# install menu
	domenu "${FILESDIR}/${PN}.desktop"

	# install icons
	local i
	for i in 16 22 24 32 48 64 128 256; do
		newicon -s "${i}x${i}" usr/share/${PN}/plugin_autenticacao_gov_${i}.png ${PN}.png
	done

	# install jar file
	insinto /usr/share/${PN}
	newins usr/share/${PN}/${PN}.jar ${PN}.jar
}
