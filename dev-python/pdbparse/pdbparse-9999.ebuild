# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=(python2_7 python3_{5,6,7})

inherit distutils-r1 git-r3 eutils

EGIT_REPO_URI="https://github.com/moyix/pdbparse"

DESCRIPTION="Python code to parse Microsoft PDB files"
HOMEPAGE="https://github.com/moyix/pdbparse"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

