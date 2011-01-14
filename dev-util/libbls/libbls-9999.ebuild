# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils waf-utils bzr

EBZR_REPO_URI="lp:libbls"

DESCRIPTION="Highly efficient, flexible and robust data manipulation library."
HOMEPAGE="http://libbls.hellug.gr"
SRC_URI=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="-x86 -amd64"
IUSE="lua +python"

DEPEND="dev-python/docutils"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}/libbls-9999-python-fixes.patch"
}

src_configure() {
	# Dummy function to do nothing
	local bindings=""
	use lua && bindings="lua"
	use python && bindings="python"
	use lua && use python && bindings="lua,python"
	${S}/waf configure --prefix="/usr" --bindings="${bindings}"
}
