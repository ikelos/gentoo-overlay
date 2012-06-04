# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git autotools

DESCRIPTION="A USB smartcard driver and development platform."
HOMEPAGE="http://www.scaramanga.co.uk/ccid-utils/"
SRC_URI="" # http://www.scaramanga.co.uk/${PN}/${P}.tar.gz"
EGIT_REPO_URI="git://github.com/giannitedesco/ccid-utils.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's|\$(python_uninstall_data) \\|\$(python_uninstall_data)|' ${S}/Makefile.am
	sed -i -e 's/--install-layout=deb//' ${S}/Makefile.am
	eautoreconf
	die
}

