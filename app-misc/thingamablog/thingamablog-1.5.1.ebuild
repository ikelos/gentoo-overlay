# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Thingamablog is a weblog software which generates pure HTML. No database or dynamic extensions are needed on the server."
HOMEPAGE="http://www.thingamablog.com"
SRC_URI="http://www.thingamablog.com/${P}.zip"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND=">=virtual/jre-1.4.0"

src_install() {
	dodir /usr/share/${PN}
	cp -r "${S}/"* "${D}/usr/share/${PN}"
	make_wrapper ${PN} "java -jar /usr/share/${PN}/${PN/t/T}.jar" /usr/share/${PN}
}
