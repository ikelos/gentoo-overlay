# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A modified unsquashfs utility that attempts to support as many hacked-up vendor-specific SquashFS implementations as possible."
HOMEPAGE="https://github.com/devttys0/sasquatch"
SRC_URI=""
EGIT_REPO_URI="https://github.com/devttys0/sasquatch.git"
EGIT_COMMIT="e4ca65b176c5fe6f3ed4efb001bab0b0ca334836"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-libs/zlib
		app-arch/xz-utils
		dev-libs/lzo"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	dodoc README.md
}
