# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://bitbucket.org/ronaldoussoren/altgraph/"
SRC_URI="https://files.pythonhosted.org/packages/da/a4/6c508ac94d7a65859a7a47e6fbde4aa6b81d0f0863aa45861241e782391c/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
