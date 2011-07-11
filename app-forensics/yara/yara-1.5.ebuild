# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A malware identification and classification tool"
HOMEPAGE="http://yara-project.googlecode.com/"
SRC_URI="http://yara-project.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="python"

DEPEND=""
RDEPEND="${DEPEND}
		 python? ( ~dev-python/yara-python-${PV} )"

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}

