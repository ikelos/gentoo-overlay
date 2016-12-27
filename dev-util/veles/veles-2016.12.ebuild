# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Binary analysis tool"
HOMEPAGE="https://codisec.com/veles/"
SRC_URI="https://codisec.com/wp-content/uploads/2016/12/${PN/v/V}_${PV}_Source.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/cmake-3.7.0
		>=dev-qt/qtgui-5
		>=dev-qt/qtcore-5"
RDEPEND="${DEPEND}"
