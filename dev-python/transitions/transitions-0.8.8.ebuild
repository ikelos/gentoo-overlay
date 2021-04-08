# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="Light-weight python state machine."
HOMEPAGE="https://github.com/pytransitions/transitions/"
SRC_URI="https://github.com/pytransitions/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graphviz test"

DEPEND="dev-python/setuptools
		dev-python/six
		graphviz? ( dev-python/pygraphviz )
		test? ( dev-python/pygraphviz
				dev-python/dill
				>=dev-python/nose-0.10.1 )"
RDEPEND="${DEPEND}"
