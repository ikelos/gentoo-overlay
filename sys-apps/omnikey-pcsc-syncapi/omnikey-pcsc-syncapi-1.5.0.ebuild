# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="syncapi_lnx"-${PV}

DESCRIPTION="Omnikey PC/SC Sync-API for Contactless Smartcards"
HOMEPAGE="http://omnikey.aaitg.com/index.php?id=69"
SRC_URI="http://www.example.com/${MY_P}.tar.gz"

RESTRICT="fetch"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/pcsc-lite"

S=${WORKDIR}/${MY_P}

pkg_nofetch() {
	einfo "Sadly the download for this file is stored at a dynamic URL."
	einfo "and wget will not name the file correctly on download."
	einfo
	einfo "Therefore please manually visit the following address:"
	einfo " http://omnikey.aaitg.com/index.php?rName=Sync-API%20for%20Linux%2032%20Bit&id=69"
	einfo "and move the downloaded file (${MY_P}.tar.gz) to "
	einfo " /usr/portage/distfiles."
}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/1.3.0-pkgconfig-prefix.patch
	for i in `ls lib/*.pc.in`;
	do
		mv $i ${i/.in/}
	done
}

src_install() {
	dodoc README doc/* hlp/*
	dolib lib/*.so* lib/*.a
	insinto /usr/include
	doins include/*
	insinto /usr/lib/pkgconfig
	doins lib/*.pc
}
