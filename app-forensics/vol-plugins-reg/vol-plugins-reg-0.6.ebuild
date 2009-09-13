# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

EAPI="2"

DESCRIPTION="Volatility plugin for examining registry files in memory files"
HOMEPAGE=""
SRC_URI="http://www.cc.gatech.edu/%7Ebrendan/volatility/dl/volreg-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-forensics/volatility"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	dodir $(python_get_sitedir)
	cp -r "${S}"/* "${D}/$(python_get_sitedir)"
}
