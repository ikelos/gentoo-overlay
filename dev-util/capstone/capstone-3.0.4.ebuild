# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: blshkv$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils multilib distutils-r1

#MY_PV=${PV//_/-}
DESCRIPTION="A lightweight multi-platform, multi-architecture disassembly framework"
HOMEPAGE="http://www.capstone-engine.org/"
SRC_URI="https://github.com/aquynh/capstone/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/3"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="python cython"

#RDEPEND="python? ( >=dev-python/capstone-python-${PV} )"
RDEPEND=""
DEPEND="cython? ( >=dev-python/cython-0.22 )
        !dev-python/capstone-python"
#TODO: add java and ocaml bindings

#S=${WORKDIR}/${PN}-${MY_PV}

src_prepare() {
	if use python; then
        cd "${S}/bindings/python"
        #our hack to adjust cython setup
		if use cython; then
            cp setup_cython.py setup.py
            #this section is from Makefile
            cp capstone/__init__.py pyx/__init__.py
			for i in arm{,_const} arm64{,_const} mips{,_const} ppc{,_const} x86{,_const} sparc{,_const} systemz sysz_const xcore{,_const}; do
			    cp capstone/${i}.py pyx/${i}.pyx
			done
        fi
		distutils-r1_src_prepare
	fi
	default_src_prepare
}

src_compile() {
	if use python; then
		cd "${S}/bindings/python"
		distutils-r1_src_compile
		cd "${S}"
	fi
	default_src_compile
}

src_install() {
	cd "${S}/bindings/python"
	distutils-r1_src_install
	cd "${S}"
	emake DESTDIR="${ED}" LIBDIRARCH=$(get_libdir) install
#	if use !test; then
#		dodir /usr/share/"${PN}"/
#		cp -R "${S}"/tests "${D}/usr/share/${PN}/" || die "Install failed!"
#	fi
	dodoc README CREDITS.TXT RELEASE_NOTES ChangeLog docs/BHUSA2014-capstone.pdf
}
