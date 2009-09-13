# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

EAPI="2"

DESCRIPTION="Volatility plugin for examining memory written by moyix"
HOMEPAGE="http://www.cc.gatech.edu/~brendan/volatility/"
SRC_URI="http://www.cc.gatech.edu/~brendan/volatility/dl/getsids.py
		 http://www.cc.gatech.edu/~brendan/volatility/dl/lists.py
		 http://www.cc.gatech.edu/~brendan/volatility/dl/moddump.py
		 http://www.cc.gatech.edu/~brendan/volatility/dl/ssdt.py
		 http://www.cc.gatech.edu/~brendan/volatility/dl/threadqueues.py
		 http://www.cc.gatech.edu/~brendan/volatility/dl/volshell.py"

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
