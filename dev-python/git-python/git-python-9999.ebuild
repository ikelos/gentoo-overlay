# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils git

EGIT_REPO_URI="http://git.gitorious.org/git-python/mainline.git"

MY_PN="GitPython"

DESCRIPTION="Python API for Git"
HOMEPAGE="http://pypi.python.org/pypi/GitPython/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="-x86 -amd64"
IUSE=""

DEPEND="dev-lang/python
		dev-vcs/git"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}-${PV}

