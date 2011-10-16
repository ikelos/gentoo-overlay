# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator eutils

MY_VERSION="$(replace_all_version_separators '-')"

EAPI=3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://www.home.unix-ag.org/simon/woof-${MY_VERSION}.py"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_unpack() {
	mkdir ${S}
	cp -L "${DISTDIR}/${A}" "${S}/woof"
}

src_prepare() {
	epatch "${FILESDIR}/woof-remove-child-process.patch"
}

src_install() {
	dobin woof
}
