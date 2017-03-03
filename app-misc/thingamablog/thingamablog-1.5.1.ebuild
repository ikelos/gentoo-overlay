# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils java-pkg-2

DESCRIPTION="Thingamablog is a weblog software which generates pure HTML. No database or dynamic extensions are needed on the server."
HOMEPAGE="http://www.thingamablog.com"
SRC_URI="http://www.thingamablog.com/${P}.zip"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="${RDEPEND}"
RDEPEND="dev-java/jsch:0
		>=virtual/jre-1.4.0"

src_prepare() {
	cd ${S}/lib
	java-pkg_jar-from jsch

#	java-pkg_jar-from swingx-1.6
#	java-pkg_jar-from swingx-beaninfo
#	java-pkg_jar-from commons-codec
#	java-pkg_jar-from commons-lang-2.1
#	java-pkg_jar-from commons-net
#	java-pkg_jar-from xmlrpc-3
#	java-pkg_jar-from beansbinding
#	java-pkg_jar-from appframework
#	java-pkg_jar-from edtftpj
#	java-pkg_jar-from hsqldb
#	java-pkg_jar-from jdom-2
#	java-pkg_jar-from jtidy
#	java-pkg_jar-from l2fprod-common

	eapply_user
}

src_install() {
	dodir /usr/share/${PN}
	
	for dir in dictionaries template_sets;
	do
		dodir /usr/share/${PN}/${dir}
		cp -r "${S}/${dir}"/* "${D}/usr/share/${PN}/${dir}"
	done

	cd "${S}/lib/"
	for lib in *.jar;
	do
		java-pkg_dojar "${S}/lib/${lib}"
	done

	java-pkg_jarinto "/usr/share/${PN}"
	java-pkg_dojar "${S}/${PN/t/T}.jar"
	java-pkg_dolauncher "${PN}" --jar /usr/share/${PN}/${PN/t/T}.jar
}
