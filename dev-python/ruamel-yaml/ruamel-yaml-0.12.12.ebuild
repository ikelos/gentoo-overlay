# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PKG_HASH="bf2cb0dfa0bb"

PYTHON_COMPAT=( python3_4 )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://bitbucket.org/ruamel/yaml/get/${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples libyaml"

S="${WORKDIR}/${PN}-${PKG_HASH}"

RDEPEND="libyaml? ( dev-libs/libyaml )
         $(python_gen_cond_dep 'dev-python/typing[${PYTHON_USEDEP}]' python2_7 'python3*')"
DEPEND="${RDEPEND}
        libyaml? ( $(python_gen_cond_dep 'dev-python/cython[${PYTHON_USEDEP}]' python2_7 'python3*') )"


src_prepare() {
  sed -i -e "s/externally-managed' not in sys.argv/externally-managed' in sys.argv/" ${S}/setup.py
  use libyaml && sed -i -e "s/if hasattr(self, '_ext_modules'):/if not hasattr(self, '_ext_modules'):/" ${S}/setup.py
  default
}

python_test() {
        esetup.py test
}

python_install_all() {
		distutils-r1_python_install_all
        if use examples; then
                dodoc -r examples
                docompress -x /usr/share/doc/${PF}
        fi
}
