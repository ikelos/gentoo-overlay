# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} )
inherit distutils-r1

DESCRIPTION="Re-apply type annotations from .pyi stubs to your codebase."
HOMEPAGE="https://github.com/ambv/retype"
SRC_URI="https://github.com/ambv/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-python/click[${PYTHON_USEDEP}]
		dev-python/typed-ast[${PYTHON_USEDEP}]
		doc? ( app-text/pandoc )"
RDEPEND="${DEPEND}"
BDEPEND=""
