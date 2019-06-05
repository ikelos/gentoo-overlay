# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1 git-r3

DESCRIPTION="Scriptable debugger library"
HOMEPAGE="https://github.com/osandov/drgn"
SRC_URI=""
EGIT_REPO_URI="https://github.com/osandov/drgn"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
