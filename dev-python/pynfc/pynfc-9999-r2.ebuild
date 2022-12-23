# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} )

inherit distutils-r1 git-r3

DESCRIPTION="Python bindings for the libnfc library"
HOMEPAGE="https://github.com/ikelos/pynfc-cffi"
SRC_URI=""
EGIT_REPO_URI="https://github.com/ikelos/pynfc-cffi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/libnfc-1.7.1"
RDEPEND="${DEPEND}"
