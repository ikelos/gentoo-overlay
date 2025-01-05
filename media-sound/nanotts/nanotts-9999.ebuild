# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/gmn/nanotts"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i -e 's/-Wall/-Wall -Wno-error=incompatible-pointer-types/' Makefile
	eapply_user
}

src_install() {
	dobin nanotts
	insinto "/usr/share/pico/lang"
	dodir "/usr/share/pico/lang"
	for i in lang/*; do
		echo "DOINS ${i}"
		doins "${i}"
	done
}
