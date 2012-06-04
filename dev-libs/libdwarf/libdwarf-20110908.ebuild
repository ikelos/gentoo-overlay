# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Library for extracting DWARF data from code objects"
HOMEPAGE="http://reality.sgiweb.org/davea/dwarf.html"
SRC_URI="http://reality.sgiweb.org/davea/libdwarf-${PV}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/dwarf-${PV}/${PN}"

src_prepare() {
	append-cflags -fPIC || die
}

src_configure() {
	econf --enable-shared
}

src_install() {
	
	dolib.a libdwarf.a || die
	dolib.so libdwarf.so || die
	
	insinto /usr/include
	# doins dwarf.h || die
	doins libdwarf.h || die

	dodoc NEWS README CHANGES || die
}
