# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Wireless Tools for the mac80211 kernel stack"
HOMEPAGE="http://wireless.kernel.org/"
SRC_URI="http://wireless.kernel.org/download/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/libnl"
RDEPEND="dev-libs/libnl"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-makefile.patch
}

