# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11} )

inherit git-r3 python-r1

DESCRIPTION="Web-of-one-file, small convenient webserver"
HOMEPAGE="https://github.com/simon-budig/woof"
SRC_URI=""
EGIT_REPO_URI="https://github.com/simon-budig/woof"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	insinto /usr/bin
	dobin woof
	python_replicate_script "${ED}/usr/bin/woof"
}
