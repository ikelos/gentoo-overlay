# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=(python{3_5,3_6,3_7})

inherit distutils-r1 git-r3 eutils

EGIT_REPO_URI="https://github.com/ikelos/pdbparse"

DESCRIPTION="Python code to parse Microsoft PDB files"
HOMEPAGE="https://github.com/moyix/pdbparse"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${DEPEND}
		dev-python/construct[$PYTHON_USEDEP]
		dev-python/pefile[$PYTHON_USEDEP]"
DEPEND=""

