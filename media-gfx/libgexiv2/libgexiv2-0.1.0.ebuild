# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://yorba.org/download/${PN/lib/}/$(get_version_component_range 1-2)/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-gfx/exiv2-0.19"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's/libtool --mode=/libtool --tag=CXX --mode=/' Makefile
}

src_install() {
	emake install DESTDIR="${D}" || die "Emake install failed."
}

