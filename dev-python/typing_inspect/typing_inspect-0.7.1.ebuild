# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} )
inherit distutils-r1

DESCRIPTION="Runtime inspection utilities for Python typing module"
HOMEPAGE="https://github.com/ilevkivskyi/typing_inspect"
SRC_URI="https://github.com/ilevkivskyi/typing_inspect/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-python/mypy_extensions-0.3[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
