# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools gnome2 git

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

src_unpack() {
	git_src_unpack
	cd ${S}
	eautoreconf
}

