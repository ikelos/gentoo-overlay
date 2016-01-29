# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/repoze-who/repoze-who-2.2.ebuild,v 1.4 2015/07/08 20:55:35 zlogene Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

MY_PN="${PN//-/.}"

DESCRIPTION="repoze.who is an identification and authentication framework for WSGI."
HOMEPAGE="http://www.repoze.org"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="repoze"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/webob[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"

src_prepare() {
	epatch "${FILESDIR}/${PN}-python3.patch"
}
