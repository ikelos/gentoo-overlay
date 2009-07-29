# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools git

EGIT_REPO_URI="git://git.gnome.org/gir-repository"

DESCRIPTION="GObject Introspection tools and library"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="-x86"
IUSE=""

DEPEND=">=dev-libs/gobject-introspection-0.6.1"
RDEPEND=">=dev-libs/gobject-introspection-0.6.1"

src_unpack() {
	git_src_unpack	
	cd ${S}
	eautoreconf
}

src_compile() {
	econf || die "Failed to configure"
	emake || die "Failed to compile"
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}
