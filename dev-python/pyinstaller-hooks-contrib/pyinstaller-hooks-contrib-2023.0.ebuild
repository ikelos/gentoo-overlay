# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/pyinstaller/${PN}/archive/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
