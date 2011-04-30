# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils eutils subversion

DESCRIPTION="Python Smartcard Library"
HOMEPAGE="http://pyscard.sourceforge.net/"
SRC_URI="" # mirror://sourceforge/${PN}/${P}.tar.gz"

ESVN_REPO_URI="https://pyscard.svn.sourceforge.net/svnroot/pyscard/trunk/pyscard/src/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-apps/pcsc-lite
		dev-lang/swig"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
	cp -r smartcard/doc/* ${D}/usr/share/doc/${P}
	cp -r smartcard/Examples ${D}/usr/share/doc/${P}
}
