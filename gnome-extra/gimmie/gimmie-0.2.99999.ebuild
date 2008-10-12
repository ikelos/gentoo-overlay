# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 autotools subversion

ESVN_REPO_URI="http://svn.gnome.org/svn/gimmie/trunk"

DESCRIPTION="Gimmie desktop bar"
HOMEPAGE="http://www.beatniksoftware.com/gimmie"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	subversion_src_unpack
	./autogen.sh	
}

