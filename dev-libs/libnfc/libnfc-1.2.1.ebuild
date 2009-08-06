# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Near Field Communications (NFC) library"
HOMEPAGE="http://www.libnfc.org/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-apps/pcsc-lite
		dev-libs/libusb"
RDEPEND="${DEPEND}"

src_prepare() {
	cp ${FILESDIR}/Makefile ${S}
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install."
}
