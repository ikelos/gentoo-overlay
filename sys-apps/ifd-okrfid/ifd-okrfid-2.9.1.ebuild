# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit multilib

MY_P="${PN/-/}_lnx"

DESCRIPTION="Omnikey Cardman 5x2x PC/SC RFID drivers"
HOMEPAGE="http://omnikey.aaitg.com/index.php?id=69"
SRC_URI="x86? ( ${MY_P}_i686-${PV}.tar.gz )
         amd64? ( ${MY_P}_x64-${PV}.tar.gz )"
		 # http://www.hidglobal.com/drivers/omnikey/${MY_P}.tar.gz"

RESTRICT="fetch"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/pcsc-lite"

S="${WORKDIR}"

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
    pkgname="${MY_P}_i686-${PV}"
	use amd64 && pkgname="${MY_P}_x64-${PV}"

	cd "${S}/${pkgname}"
	dodir "/usr/$(get_libdir)/readers/usb"
	cp -r "${pkgname}.bundle" "${D}/usr/$(get_libdir)/readers/usb"
	insinto /etc
	doins cmrfid.ini
	dodoc README
}


