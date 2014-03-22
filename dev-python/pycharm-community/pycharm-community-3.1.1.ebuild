EAPI="4"

inherit eutils

PBN=$(echo ${PN}|cut -d"-" -f1)
PB="${PBN}-${PV}"

DESCRIPTION="Powerful Python and Django IDE similar to IntelliJ IDEA"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

KEYWORDS="~x86 ~amd64"

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}
		!dev-util/pycharm-professional"
RESTRICT="strip mirror"

SLOT="0"
S=${WORKDIR}

src_prepare() {
	sed -i ${S}/${P}/bin/${PBN}.sh -e 's/^\(\ *read IGNORE\)/#\1/'
}

src_install() {
	dodir /opt/${PN}
	mv "${S}/${P}" "${D}/opt/${PBN}" || die

	dosym /opt/${PBN}/bin/pycharm.sh /usr/bin/${PBN}
	doicon "${D}/opt/${PBN}/bin/${PBN}.png"
	make_desktop_entry ${PBN} "PyCharm ${PV}" ${PBN} "Development;IDE"
}

pkg_postinst() {
	ewarn "According to JetBrains, PyCharm has performance and"
	ewarn "graphics issues with OpenJDK Java."
	ewarn ""
	ewarn "Please consider using Oracle JDK."
	ewarn "Especially before reporting problems upstream."
}
