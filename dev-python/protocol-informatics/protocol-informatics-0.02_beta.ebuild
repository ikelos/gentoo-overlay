# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=(python2_7)

inherit distutils-r1 eutils

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
	default_src_prepare
}

src_install() {
	distutilsi-r1_src_install

	newbin main.py PI.py
}

