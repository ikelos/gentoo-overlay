# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Highly efficient, flexible and robust data manipulation library."
HOMEPAGE="http://libbls.hellug.gr"
SRC_URI="http://libbls.hellug.gr/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-util/scons"
RDEPEND=""

src_compile() {
	cd ${S}
	scons || die "Failed to compile"
}

src_install() {
	cd ${S}
	scons prefix=/usr destdir="${D}" install || die "Failed to install"
}
