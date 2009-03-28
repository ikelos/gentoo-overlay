# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Open Free Fiasco Firmware Flasher"
HOMEPAGE="http://www.nopcode.org/0xFFFF/"
SRC_URI="http://www.nopcode.org/0xFFFF/get/0xFFFF-0.4.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	emake install DESTDIR=${D} || die "Failed to install"
}

