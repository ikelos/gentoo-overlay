# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

EAPI="2"

DESCRIPTION="Volatility plugin for examining crypto in memory files"
HOMEPAGE="http://jessekornblum.com/tools/"
SRC_URI="http://jessekornblum.com/tools/volatility/cryptoscan.py
		 http://jessekornblum.com/tools/volatility/suspicious.py"
#		 Requires Andreas Schuster's enhancements to volatility
#		 http://mhl-malware-scripts.googlecode.com/files/driverirp.py

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-forensics/volatility"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	for i in ${A};
	do
		echo "Copying ${i} from ${DISTDIR} to ${S}"
		cp -L "${DISTDIR}/${i}" "${S}"
	done
}

src_install() {
	local plugindir="$(python_get_sitedir)/memory_plugins"
	insinto ${plugindir}
	dodir ${plugindir}
	doins "${S}"/*
}
