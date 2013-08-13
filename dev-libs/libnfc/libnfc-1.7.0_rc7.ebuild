# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libnfc/libnfc-1.4.2.ebuild,v 1.2 2011/03/20 18:11:44 ssuominen Exp $

EAPI="4"

inherit eutils versionator

MY_P=${P/_/-}

DESCRIPTION="Near Field Communications (NFC) library"
HOMEPAGE="http://www.libnfc.org/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc debug"

RDEPEND="sys-apps/pcsc-lite
	virtual/libusb:0"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-usb-rescan.patch"
}

src_configure() {
	econf $(use_enable debug) || die "Failed to configure"
}

src_compile() {
	emake || die "Failed to compile."
	use doc && doxygen
}

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install properly."
	use doc && dohtml "${S}"/doc/html/*
}
