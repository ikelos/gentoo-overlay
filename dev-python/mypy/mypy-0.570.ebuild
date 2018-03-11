# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Optional static typing for Python"
HOMEPAGE="http://www.mypy-lang.org/"
# We do not use SRC_URI from 
# https://github.com/python/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
# because we would also need to grab typeshed which hasn't had an official release yet
SRC_URI=""
EGIT_REPO_URI="https://github.com/python/${PN}"

if [ "${PV}" != "9999" ]; then
EGIT_COMMIT="v${PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
	~dev-python/psutil-5.4.0[${PYTHON_USEDEP}]
	~dev-python/typed-ast-1.1.0[${PYTHON_USEDEP}]
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
"
RDEPEND="${DEPEND}"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	local PYTHONPATH="$(pwd)"

	"${PYTHON}" runtests.py || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )

	distutils-r1_python_install_all
}
