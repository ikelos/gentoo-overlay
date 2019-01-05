# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/0xd4d/${PN}/releases/download/v${PV}/${PN}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		>=dev-lang/mono-4.6"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	# Remove programs that won't work
	rm "${S}/dnSpy{,-x86}.exe"

	dodir "/opt/${PN}"
	insinto "/opt/${PN}"
	exeinto "/opt/${PN}"
	doins -r "${S}"/*
	doexe "${S}"/*.exe

	make_wrapper dnSpy.Console.exe "mono /opt/${PN}/dnSpy.Console.exe"
}
