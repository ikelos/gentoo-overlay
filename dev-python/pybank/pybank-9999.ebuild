# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python subversion

ESVN_REPO_URI="http://svn.gnome.org/svn/pybank/trunk"

DESCRIPTION="Python Gobject Introspection Library"
HOMEPAGE="http://live.gnome.org/PyBank"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/gobject-introspection
		dev-libs/gir-repository"
RDEPEND="dev-libs/gobject-introspection
		 dev-libs/gir-repository"

src_unpack() {
	python_version
	subversion_src_unpack
	cd ${S}
	sed -i -e "s/PY_VERSION=.*/PY_VERSION=${PYVER}/" -e "s/PYTHON=.*/PYTHON=python/" Makefile
}

src_install() {
	insinto $(python_get_sitedir)/bank
	doins ${S}/bank/*.py ${S}/bank/*.so
	dodoc README ChangeLog *.py
}
