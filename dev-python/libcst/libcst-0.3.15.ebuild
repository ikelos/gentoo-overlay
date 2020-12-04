# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="A concrete syntax tree parser and serializer library for Python"
HOMEPAGE="https://github.com/Instagram/LibCST"
SRC_URI="https://github.com/Instagram/LibCST/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/LibCST-${PV}"

DEPEND=">=dev-python/pyyaml-5.2[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-3.7.4.2[${PYTHON_USEDEP}]
		>=dev-python/typing_inspect-0.6.0[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""


