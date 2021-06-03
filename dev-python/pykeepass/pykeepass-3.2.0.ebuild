# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9,10} )
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
		>=dev-python/future-0.17[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.3.5[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
		=dev-python/pycryptodome-3.9.4[${PYTHON_USEDEP}]
		>=dev-python/construct-2.9[${PYTHON_USEDEP}]
		dev-python/argon2_cffi[${PYTHON_USEDEP}]"
BDEPEND=""

PATCHES=("${FILESDIR}/${PN}-3.0.3-dont-install-tests.patch")
