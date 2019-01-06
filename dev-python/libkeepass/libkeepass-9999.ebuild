# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 python3_7)
inherit git-r3 distutils-r1

DESCRIPTION="Python module to read KeePass 1.x/KeePassX (v3) and KeePass 2.x (v4) files"
HOMEPAGE="https://github.com/crass/libkeepass"
SRC_URI=""

EGIT_REPO_URI="https://github.com/crass/libkeepass"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/lxml-3.2.1
		>=dev-python/nose-1.3.0
		|| ( >=dev-python/pycryptodome-3.4.6
		>=dev-python/pycrypto-2.6.1 )
		>=dev-python/colorama-0.3.2"
RDEPEND="${DEPEND}"
