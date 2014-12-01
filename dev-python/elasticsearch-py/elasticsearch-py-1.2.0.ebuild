# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7 python3_2 python3_3 python3_4)

inherit distutils-r1

DESCRIPTION="Elasticsearch python bindings"
HOMEPAGE="https://github.com/elasticsearch/elasticsearch-py"
SRC_URI="https://github.com/elasticsearch/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/urllib3"
RDEPEND="${DEPEND}"


