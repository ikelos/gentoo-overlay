# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit git-r3 distutils-r1

DESCRIPTION="JFFS2 filesystem extraction tool"
HOMEPAGE="https://github.com/sviehb/jefferson"
SRC_URI=""
EGIT_REPO_URI="https://github.com/sviehb/jefferson"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/cstruct"
RDEPEND="${DEPEND}"
