# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} )
inherit distutils-r1

MY_PN="MonkeyType"

DESCRIPTION="A system that generates static type annotations by collecting runtime types"
HOMEPAGE="https://github.com/Instagram/MonkeyType"
SRC_URI="https://github.com/Instagram/MonkeyType/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/libcst-0.3.7[${PYTHON_USEDEP}]
		dev-python/mypy_extensions[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
