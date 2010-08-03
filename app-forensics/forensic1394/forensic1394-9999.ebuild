# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils distutils cmake-utils git

DESCRIPTION="Library for carrying out memory forensics using firewire/ieee1394."
HOMEPAGE="http://freddie.witherden.org/tools/libforensic1394/"
SRC_URI=""
EGIT_REPO_URI="git://git.freddie.witherden.org/forensic1394.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="python"

DEPEND="python? ( =dev-lang/python-2.6* )"
RDEPEND="${DEPEND}"

src_compile() {
	cmake-utils_src_compile
	if $(use python); then
		einfo "Compiling python modules..."
		cd "${S}/python"
		distutils_src_compile
	fi
}

src_install() {
	cmake-utils_src_install
	if $(use python); then
		einfo "Installing python modules..."
		cd "${S}/python"
		distutils_src_install
	fi
}

