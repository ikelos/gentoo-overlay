# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="Binary Grep"
HOMEPAGE="http://debugmo.de/?p=100"
SRC_URI="http://debugmo.de/wp-content/uploads/2009/04/bgrep.c"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/${A}" "${S}"
}

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} "${PN}.c" -o "${PN}"
}

src_install() {
	dobin ${PN}
}

