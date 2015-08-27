# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/Kurento/${PN}"
EGIT_COMMIT="${P}"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-video/kms-cmake-utils
		net-libs/rabbitmq-c"
RDEPEND="${DEPEND}"

