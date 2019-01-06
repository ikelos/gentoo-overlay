# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1 git-r3

MY_PN="mypy"
MY_PV="0.650"

DESCRIPTION="Optional static typing for Python"
HOMEPAGE="http://www.mypy-lang.org/"
SRC_URI="" # https://github.com/python/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/python/${MY_PN}"

if [ "${PV}" != "9999" ]; then
EGIT_COMMIT="v${MY_PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND="
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
"
DEPEND="
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	${RDEPEND}
"

S="${WORKDIR}/${P}/extensions"

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
