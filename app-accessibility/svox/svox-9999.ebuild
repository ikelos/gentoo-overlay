# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 eutils autotools

EGIT_REPO_URI="https://android.googlesource.com/platform/external/svox/"

DESCRIPTION="SVOX PicoTTS text-to-speech engine"
HOMEPAGE="https://android.googlesource.com/platform/external/svox/+/master"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

EPATCH_FORCE="yes"

src_prepare() {
	epatch -p1 ${FILESDIR}
	cd "${S}/pico"
	eautoreconf
}

src_configure() {
	cd "${S}/pico"
	default_src_configure
}

src_compile() {
	cd "${S}/pico"
	default_src_compile
}

src_install() {
	cd "${S}/pico"
	default_src_install
}

