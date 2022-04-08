# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9,10} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/functiontrace/
"
SRC_URI="https://gitlab.com/mbryant/${PN}/-/archive/master/${PN}-master.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/functiontrace-server"
BDEPEND=""

S="${WORKDIR}/${PN}-master/py-${PN}"

distutils_enable_tests pytest
