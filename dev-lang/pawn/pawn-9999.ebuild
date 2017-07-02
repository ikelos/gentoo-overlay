# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Pawn is a quick and small scripting language that requires few resources."
HOMEPAGE="https://github.com/compuphase/pawn"
SRC_URI=""

EGIT_REPO_URI="https://github.com/compuphase/pawn"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
    cd "${S}_build"
	dobin pawn{cc,run,dbg,disasm} stategraph
	
	dodoc "${S}/doc/"*  "${S}/examples/"*.p
}
