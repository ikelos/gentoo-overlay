# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils

MY_PN=${PN/v/V}

DESCRIPTION="Forensic tool for analyzing volatile memory"
HOMEPAGE="http://www.volatilesystems.com/"
SRC_URI="http://www.volatilesystems.com/downloads/${PN}/${PV}/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/${MY_PN}-${PV}

src_install() {
	distutils_src_install
	insinto /usr/share/${PN}
	doins volatility v*.py
	make_wrapper volatility "python /usr/share/${PN}/volatility"
}

