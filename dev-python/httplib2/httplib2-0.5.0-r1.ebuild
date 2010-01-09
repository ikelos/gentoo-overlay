# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/httplib2/httplib2-0.5.0.ebuild,v 1.4 2009/10/07 17:36:14 nixnut Exp $

EAPI="2"

NEED_PYTHON="2.3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A comprehensive HTTP client library with caching and authentication."
HOMEPAGE="http://code.google.com/p/httplib2/ http://pypi.python.org/pypi/httplib2"
SRC_URI="http://httplib2.googlecode.com/files/${P}.tar.gz
	http://httplib2.googlecode.com/files/${PN}-python3-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND=""
RDEPEND=""

DISTUTILS_USE_SEPARATE_SOURCE_DIRECTORIES="1"

src_prepare() {
	distutils_src_prepare

	local dir
	for dir in "${WORKDIR}/${P}-3"*; do
		if [[ -d "${dir}" ]]; then
			rm -fr "${dir}" || die
			cp -lpr "${WORKDIR}/${PN}-python3-${PV}" "${dir}" || die
		fi
	done

	cd ${WORKDIR}
	epatch ${FILESDIR}/${P}-issue-62.patch
}

src_install() {
	distutils_src_install
	dodoc README
	newdoc "${WORKDIR}/${PN}-python3-${PV}/README" README-python3
}