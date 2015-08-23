# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user

DESCRIPTION="Tool for simulating an entire internet with working services on a single box."
HOMEPAGE="http://www.inetsim.org/"
SRC_URI="http://www.inetsim.org/downloads/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/IPC-Shareable
		dev-perl/net-server"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup inetsim
}

src_install() {
	dodir /opt/${PN}
	cp -a ${S}/* ${EROOT}${D}/opt/${PN}/

	cd ${EROOT}${D}/opt/${PN}/
	./setup.sh
}

pkg_postinst() {
	# fowners only works on files not on directories (see bug 141619)

	chown -R :inetsim /opt/${PN}/data/
	chown -R :inetsim /opt/${PN}/log/
	chown -R :inetsim /opt/${PN}/report/
}

