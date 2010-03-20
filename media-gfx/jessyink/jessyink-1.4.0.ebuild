# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="An inkscape plugin to create SVG presentations"
HOMEPAGE="http://jessyink.googlecode.com/"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		 media-gfx/inkscape"

src_install() {
	insinto /usr/share/inkscape/extensions
	doins ${S}/inkscapeExtensions/*

	dodoc README.txt JessyInk.svg JessyInkLogo.svg
}

