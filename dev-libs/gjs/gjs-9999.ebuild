# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools gnome2 subversion

ESVN_REPO_URI="http://svn.gnome.org/svn/gjs/trunk/"

DESCRIPTION="Gnome GJS"
HOMEPAGE="http://live.gnome.org/gjs"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/trunk

src_unpack() {
	subversion_src_unpack
	cd ${S}
	eautoreconf
}
