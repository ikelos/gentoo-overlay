# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

DESCRIPTION="Python Keepass library"
HOMEPAGE="https://github.com/pschmitt/pykeepass/"
SRC_URI="https://github.com/pschmitt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		>=dev-python/construct-2.9[${PYTHON_USEDEP}]
		dev-python/argon2_cffi[${PYTHON_USEDEP}]"
BDEPEND=""

PATCHES=("${FILESDIR}/${PN}-3.0.2-dont-install-tests.patch")
