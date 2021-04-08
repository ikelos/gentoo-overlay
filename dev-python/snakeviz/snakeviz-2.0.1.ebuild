# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="A visualization interface for python profile information"
HOMEPAGE="http://jiffyclub.github.io/snakeviz/"
SRC_URI="https://github.com/jiffyclub/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="-*"
IUSE=""

DEPEND=">=www-servers/tornado-2.0"
RDEPEND="${DEPEND}"
