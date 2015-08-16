# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools gnome2 git-r3

EGIT_REPO_URI="git://github.com/chipx86/gtkparasite.git"

DESCRIPTION="Tool for GTK debugging and live interaction"
HOMEPAGE="http://gtkparasite.googlecode.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-x86 -amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	cd ${S}
	eautoreconf
}

