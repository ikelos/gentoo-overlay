# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 toolchain-funcs

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="git://github.com/gamelinux/passivedns.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/ldns
		net-libs/libpcap"
RDEPEND="${DEPEND}"

#src_prepare() {
#	sed -i -e 's|OCFLAGS=.*|OCFLAGS=-I/usr/include|' "${S}/src/Makefile" || die "Failed to sed the Makefile"
#}

src_compile() {
	cd "${S}/src"
	emake
}

src_install() {
	cd "${S}/src"
	dobin passivedns
	dodoc -r "${S}/doc"
}

