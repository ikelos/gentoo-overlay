# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python git

EGIT_REPO_URI="git://github.com/chipx86/gitty.git"

DESCRIPTION="Python-based Gitk replacement"
HOMEPAGE="http://github.com/chipx86/gitty/tree/master"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pygtk
		 dev-util/git"

src_install() {
	python_version
	dodir /usr/lib/python${PYVER}/site-packages
	cp -r Gitty ${D}/usr/lib/python${PYVER}/site-packages
	newbin gitty.py gitty
}

pkg_postinst() {
	python_mod_optimize
}

pkg_postrm() {
	python_mod_cleanup
}
