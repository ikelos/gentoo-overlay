# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

ESVN_REPO_URI="http://volatility.googlecode.com/svn/branches/${P/v/V}"

DESCRIPTION="Forensic tool for analyzing volatile memory"
HOMEPAGE="http://code.google.com/p/volatility/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	distutils_src_install
	mkdir ${D}/usr/share/${PN}
	mv ${D}/usr/plugins ${D}/usr/share/${PN}
	dosym /usr/bin/volatility.py volatility
}

