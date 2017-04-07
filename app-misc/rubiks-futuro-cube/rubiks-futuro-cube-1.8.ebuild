# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Rubiks Futuro Cube Suite"
HOMEPAGE="http://www.futurocube.com/"
SRC_URI="http://isle.princip.cz/download/futurocube/sdk_suite/${PN}.SC${PV}.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python:2.7
		dev-python/pillow
		dev-python/pyserial
		dev-python/ipython
		dev-python/wxpython:2.8"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i -e 's/python/python2/' ${PN}

	eapply_user
}

src_install() {
	dodir "/opt/${PN}/"

	insinto "/opt/${PN}"
	doins -r "${S}"/*
	exeinto "/opt/${PN}"
	doexe "${S}/${PN}"
	exeinto "/opt/${PN}/lib/futurocubesuite/bin/"
	doexe "${S}/lib/futurocubesuite/bin/"*

	insinto /etc/udev/rules.d
	doins ${FILESDIR}/95-futurocube.rules
}
