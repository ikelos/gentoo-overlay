# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9,10} )
inherit distutils-r1

DESCRIPTION="A library for demangling and mangling Visual Studio C++ names. "
HOMEPAGE="https://github.com/AVGTechnologies/cppmangle"
SRC_URI="https://github.com/AVGTechnologies/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/speg"
RDEPEND="${DEPEND}"
BDEPEND=""
