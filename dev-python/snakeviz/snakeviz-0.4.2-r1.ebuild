# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

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
