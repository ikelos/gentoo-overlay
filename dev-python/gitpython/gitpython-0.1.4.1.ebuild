# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="GitPython"

DESCRIPTION="Python API for Git"
HOMEPAGE="http://pypi.python.org/pypi/GitPython/"
SRC_URI="http://pypi.python.org/packages/source/G/${MY_PN}/${MY_PN}-0.1.4.1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python
		dev-util/git"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}-${PV}

