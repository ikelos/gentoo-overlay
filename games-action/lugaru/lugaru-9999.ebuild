# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games cmake-utils mercurial eutils

DESCRIPTION="A cross platform 3d action adventure"
HOMEPAGE="http://www.wolfire.com/lugaru"
SRC_URI=""
EHG_REPO_URI="https://code.google.com/p/${PN}/"

LICENSE="GPL-2 free-noncomm"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/libjpeg-turbo
	media-libs/libogg
	media-libs/libpng
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/openal
	virtual/opengl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	epatch "${FILESDIR}/${PN}-data-dir.patch"
	true # sed -i "s|:Data:|/${GAMES_DATADIR}/${PN}:Data:|g" Source/*.* || die
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r Data || die
	dogamesbin ../${P}_build/${PN} || die
	make_desktop_entry ${PN} "Lugaru: The Rabbit's Foot"
	prepgamesdirs
}
