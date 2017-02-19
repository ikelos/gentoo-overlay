# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Cheroot is the high-performance, pure-Python HTTP server used by CherryPy."
HOMEPAGE="http://www.cherrypy.org/ https://pypi.python.org/pypi/CherryPy"
SRC_URI="mirror://pypi/C/${PN/c/C}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	test? ( >=dev-python/nose-1.3.3[${PYTHON_USEDEP}] )"
RDEPEND=""

# testsuite predominantly connects to the network
RESTRICT="test"

python_test() {
	# suite requires current latest nose-1.3.3
	# https://bitbucket.org/cherrypy/cherrypy/issue/1308
	# https://bitbucket.org/cherrypy/cherrypy/issue/1306
	local exclude=(
		-e test_file_stream -e test_4_File_deletion -e test_3_Redirect
		-e test_2_File_Concurrency -e test_0_Session -e testStatic
	)

	# This really doesn't sit well with multiprocessing
	# The issue 1306 tells us some tests are subject to the deleterious effects of
	# the 'race condition'.  Both the issues are unresolved / open
#	if [[ "${EPYTHON}" == pypy ]]; then
		nosetests "${exclude[@]}" -I test_logging.py || die "Testing failed with ${EPYTHON}"
#	else
#		nosetests "${exclude[@]}" < /dev/tty || die "Testing failed with ${EPYTHON}"
#	fi
}
