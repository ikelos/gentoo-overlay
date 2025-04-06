# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Signal backup tools"
HOMEPAGE="https://github.com/bepaald/signalbackup-tools/"
SRC_URI="https://github.com/bepaald/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/dbus
		dev-db/sqlite
		dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin "${BUILD_DIR}/${PN}"
	dodoc README.md
}
