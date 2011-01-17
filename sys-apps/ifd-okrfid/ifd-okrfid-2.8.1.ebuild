# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${PN/-/}_lnx_i686-${PV}"

DESCRIPTION="Omnikey Cardman 5x2x PC/SC RFID drivers"
HOMEPAGE="http://omnikey.aaitg.com/index.php?id=69"
SRC_URI="${MY_P}.tar.gz" # http://www.hidglobal.com/drivers/omnikey/${MY_P}.tar.gz"

RESTRICT=""

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
	einfo " http://www.hidglobal.com/driverDownloads.php?techCat=19&prod_id=171"
	einfo "and move the downloaded file (${MY_P}.tar.gz) to "
	einfo " /usr/portage/distfiles."
}

src_install() {
	cd ${S}
	dodir /usr/lib/readers/usb
	cp -r ${MY_P}.bundle ${D}/usr/lib/readers/usb
	insinto /etc
	doins cmrfid.ini
	dodoc README
}


