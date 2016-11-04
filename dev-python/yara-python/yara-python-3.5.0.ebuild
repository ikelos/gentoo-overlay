# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=(python2_7 python3_4)

inherit distutils-r1

DESCRIPTION="A malware identification and classification tool"
HOMEPAGE="http://virustotal.github.io/yara/"
SRC_URI="https://github.com/VirusTotal/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="~app-forensics/yara-${PV}"
RDEPEND="${DEPEND}"

# This is easier than rewriting the python phases to add an argument *after* build
# rather than before it with mydistutilsargs
PATCHES=( "${FILESDIR}"/${PN}-3.5.0-dynamic-linking.patch )
