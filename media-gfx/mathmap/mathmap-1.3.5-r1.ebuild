# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="Mathmap is an image manipulation scripting plugin for the Gimp"
HOMEPAGE="http://www.complang.tuwien.ac.at/schani/mathmap/index.html"
SRC_URI="http://www.complang.tuwien.ac.at/schani/mathmap/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-gfx/gimp-2.2
		 sci-libs/gsl
		 x11-libs/gtksourceview
		 gnome-base/libgnomecanvas
		 sci-libs/fftw:3.0"
DEPEND="${RDEPEND}
		app-doc/doxygen"

src_prepare() {
	epatch "${FILESDIR}/${PN}-libpng16.patch"
}

src_compile() {
	emake -j1 || die "Failed to compile"
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}

