# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit subversion distutils

DESCRIPTION="Python bindings for the libnfc library"
HOMEPAGE="http://pynfc.googlecode.com/"
SRC_URI=""

ESVN_REPO_URI="http://pynfc.googlecode.com/svn/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/libnfc-1.3.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	cd "${S}/src"
	distutils_src_compile
}

src_install() {
	cd "${S}/src"
	distutils_src_install
	dodir /usr/share/${PN}
	mv "${D}/usr/examples" "${D}/usr/share/${PN}"
}
