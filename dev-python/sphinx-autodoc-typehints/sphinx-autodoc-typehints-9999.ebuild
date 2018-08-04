# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1

COMMON_SRC_URI="https://patch-diff.githubusercontent.com/raw/agronholm/sphinx-autodoc-typehints/pull/46.patch -> ${P}-46.patch"

if [ ${PV} == "9999" ];
then
SRC_URI="${COMMON_SRC_URI}"
inherit git-r3
EGIT_REPO_URI="https://github.com/agronholm/${PN}"
else
SRC_URI="https://github.com/agronholm/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
		${COMMON_SRC_URI}"
fi

DESCRIPTION="Type hints support for the Sphinx autodoc extension"
HOMEPAGE="https://github.com/agronholm/sphinx-autodoc-typehints"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s/use_scm_version=True/version='${PV}'/" setup.py
	eapply "${DISTDIR}/${P}-46.patch"

	default
}
