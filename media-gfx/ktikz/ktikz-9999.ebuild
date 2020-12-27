# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils cmake qmake-utils git-r3 xdg

DESCRIPTION="A QT5-based editor for the TikZ language"
HOMEPAGE="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language"
LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""
IUSE="kde +doc -debug"

EGIT_REPO_URI="https://github.com/fhackenberger/ktikz.git"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtprintsupport:5
	app-text/poppler[qt5]
	doc? ( dev-qt/qthelp:5 )
	kde? (
		kde-frameworks/kxmlgui
		kde-frameworks/ktexteditor
		kde-frameworks/kparts
		kde-frameworks/kiconthemes
	)
	virtual/latex-base
	dev-tex/pgf
	dev-texlive/texlive-latexextra
"
RDEPEND="${DEPEND}
	!media-gfx/ktikz:4
"

DOCS="Changelog TODO"

src_prepare() {
	if use kde; then
		cmake_src_prepare
	fi
	eapply_user
}

src_configure() {
	if use kde; then
		cmake_src_configure
	else
		KDECONFIG="CONFIG-=usekde"
		eqmake5 qtikz.pro "CONFIG+=nostrip" "$KDECONFIG"
	fi
}

src_compile() {
		if use !doc; then
		    cmake_comment_add_subdirectory doc
		fi
		if use kde; then
			cmake_src_compile
		else
			emake
		fi
}

src_install() {
		if use kde; then
			cmake_src_install
		else
			emake INSTALL_ROOT="${D}" install
		fi
}
