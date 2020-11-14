# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Library for implementing RPC/SOAP in python"
HOMEPAGE="http://spyne.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="httprpc msgpack json yaml html xml"

DEPEND=""
RDEPEND="${DEPEND}
		dev-python/pytz
		html? ( >=dev-python/lxml-3.2.5 )
		xml? ( >=dev-python/lxml-3.4.1 )
		httprpc? ( dev-python/werkzeug )
		msgpack? ( dev-python/msgpack )
		json? ( dev-python/simplejson )
		yaml? ( dev-python/pyyaml )"
