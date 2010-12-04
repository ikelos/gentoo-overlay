# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="Python Smartcard Library"
HOMEPAGE="http://pyscard.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-apps/pcsc-lite
		dev-lang/swig"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	# epatch ${FILESDIR}/${PV}-contactless.patch
}

src_install() {
	distutils_src_install
	cp -r smartcard/doc/* ${D}/usr/share/doc/${P}
	cp -r smartcard/Examples ${D}/usr/share/doc/${P}
}
