# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="git://github.com/hellman/xortool.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/${PN}
	doins ${S}/*.py
	dodoc ${S}/README.md
	make_wrapper ${PN} "/usr/bin/python /usr/share/${PN}/${PN}.py"
}

