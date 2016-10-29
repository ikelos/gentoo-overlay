# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="6"

EGIT_REPO_URI="git://github.com/sciyoshi/pyfacebook.git"

PYTHON_COMPAT=("python2_7")

inherit distutils-r1 eutils versionator git-r3

DESCRIPTION="Python Client Library for the Facebook API"
HOMEPAGE="http://code.google.com/p/pyfacebook"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE="examples test"

RDEPEND="dev-lang/python
		 dev-python/django
         dev-python/simplejson"
DEPEND="${RDEPEND}"

src_test() {
	elog "Please note: You're using a live GIT ebuild."
	elog "We therefore won't fix any failures in the tests."
	elog "If you think it's pyfacebook's fault report it to upstream."
	elog "Otherwise either disable the tests or use a stable version."
	PYTHONPATH="." ${python} tests/test.py || die "tests failed"
}

src_install() {
	distutils-r1_src_install

	dobin bin/djangofb.py

	if use examples ; then	
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
