# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11,12} )
PYTHON_REQ_USE='threads(+)'

inherit distutils-r1

DESCRIPTION="Program converting Python programs into stand-alone executables"
HOMEPAGE="https://www.pyinstaller.org"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pyinstaller/pyinstaller"
	EGIT_BRANCH="develop"
else
	MY_PN="PyInstaller"
	MY_P="${MY_PN}-${PV}"
	SRC_URI="https://github.com/pyinstaller/pyinstaller/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="clang debug doc leak-detector"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

QA_PREBUILT="usr/lib/python*/site-packages/PyInstaller/bootloader/Linux-*"

RDEPEND="${PYTHON_DEPS}
		sys-libs/zlib
		dev-python/pyinstaller-hooks-contrib[${PYTHON_USEDEP}]
		dev-python/altgraph[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	leak-detector? ( dev-libs/boehm-gc )
	clang? ( sys-devel/clang )
	!clang? ( sys-devel/gcc )"

src_install() {
	distutils-r1_src_install
	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/50${PN}
}
