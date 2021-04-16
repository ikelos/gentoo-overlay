# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3 eutils autotools

EGIT_REPO_URI="https://android.googlesource.com/platform/external/svox/"

DESCRIPTION="SVOX PicoTTS text-to-speech engine"
HOMEPAGE="https://github.com/naggety/picotts"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( 
		"${FILESDIR}/0001-autoconf-building-of-library-using-libtool.patch"
		"${FILESDIR}/0002-gitignore-for-autotools-files.patch"
		"${FILESDIR}/0003-pico2wave-Convert-text-to-.wav-using-svox-text-to-sp.patch"
		"${FILESDIR}/0004-add-header-files.patch"
		"${FILESDIR}/0005-Install-lang-files.patch"
		"${FILESDIR}/0006-Set-picolangdir.patch"
		"${FILESDIR}/0007-stdint-uintptr.patch"
		)

src_prepare() {
	default_src_prepare
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

