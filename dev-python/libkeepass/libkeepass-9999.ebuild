# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit git-r3 distutils-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="https://github.com/crass/libkeepass"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/lxml-3.2.1
        >=dev-python/nose-1.3.0
		>=dev-python/pycrypto-2.6.1
		>=dev-python/colorama-0.3.2"
RDEPEND="${DEPEND}"
