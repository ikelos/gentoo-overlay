# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools subversion

ESVN_REPO_URI="http://svn.gnome.org/svn/gobject-introspection/trunk"

DESCRIPTION="GObject Introspection tools and library"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="-x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	subversion_src_unpack	
	eautoreconf
}

src_compile() {
	econf || die "Failed to configure"
	emake || die "Failed to compile"
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}
