# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Mathmap is an image manipulation scripting plugin for the Gimp"
HOMEPAGE="http://www.complang.tuwien.ac.at/schani/mathmap/index.html"
SRC_URI="http://www.complang.tuwien.ac.at/schani/mathmap/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=media-gfx/gimp-2.2
		sci-libs/gsl
		x11-libs/gtksourceview
		gnome-base/libgnomecanvas"
RDEPEND="${DEPEND}"

pkg_setup() {
	if ! $(built_with_use sci-libs/gsl cblas); then
		die "sci-libs/gsl must be built with USE='cblas'"
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e 's/GIMPDATADIR := /GIMPDATADIR := $(DESTDIR)/' Makefile
	sed -i -e 's/--install-admin-bin/--prefix=$(DESTDIR) --install-admin-bin/' Makefile
	sed -i -e 's/mkdir/mkdir -p/' Makefile
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}

