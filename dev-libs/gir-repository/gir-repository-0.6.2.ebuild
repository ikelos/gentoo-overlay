# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools gnome2

DESCRIPTION="GObject Introspection tools and library"
HOMEPAGE="http://live.gnome.org/GObjectIntrospection"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/gobject-introspection"
RDEPEND="dev-libs/gobject-introspection"

pkg_setup() {
	if ! built_with_use sys-devel/gcc libffi; then
		eerror "Please rebuild gcc with USE=\"libffi\" enabled."
		die "GCC not build with libffi support"
	fi
}

src_unpack() {
	gnome2_src_unpack
	eautoreconf
}

src_compile() {
	MAKEOTPS="-j1"
	gnome2_src_compile
}
