# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils eutils

DESCRIPTION=""
HOMEPAGE="http://phreakocious.net/PI/"
SRC_URI="http://phreakocious.net/PI/PI-${PV/_/-}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/pyrex"
RDEPEND="${DEPEND}"

S="${WORKDIR}/PI"

src_prepare() {
	epatch "${FILESDIR}/pi-0.02-numpy.patch"
}

src_install() {
	distutils_src_install

	newbin main.py PI.py
}

