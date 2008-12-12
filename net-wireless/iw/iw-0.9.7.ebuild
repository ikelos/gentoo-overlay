# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Wireless Tools for the mac80211 kernel stack"
HOMEPAGE="http://wireless.kernel.org/"
SRC_URI="http://wireless.kernel.org/download/${PN}/${P}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/libnl
		dev-util/pkgconfig"
RDEPEND="dev-libs/libnl"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-makefile.patch
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}
