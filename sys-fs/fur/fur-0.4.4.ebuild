# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="FUR"

DESCRIPTION="Mounts SynCE file systems using FUSE"
HOMEPAGE="http://www.infis.univ.ts.it/~riccardo/FUR.html"
SRC_URI="http://www.infis.univ.ts.it/~riccardo/downloads/${MY_PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-pda/synce-librapi2
		sys-fs/fuse"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	dobin Fur
	dodoc docs/* README.txt
}
