# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$ 

EAPI=5

PYTHON_COMPAT=( python2_{6,7} python3_{2,3,4,5} )

inherit distutils-r1

DESCRIPTION="Editable interval tree data structure for Python 2 and 3"
HOMEPAGE="https://github.com/chaimleib/intervaltree"
SRC_URI="https://github.com/chaimleib/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/sortedcontainers"
RDEPEND="${DEPEND}"
