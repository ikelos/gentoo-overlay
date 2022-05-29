# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

# pass-import makes only one Python implementation, needs PYTHON_SINGLE_TARGET.
inherit python-single-r1

DESCRIPTION="generic importer extension for password manager ZX2C4's pass"
HOMEPAGE="https://github.com/roddhjav/pass-import"
SRC_URI="https://github.com/roddhjav/pass-import/archive/v${PV}.tar.gz
		-> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="app-shells/bash
		dev-python/cryptography
		dev-python/defusedxml
	|| (
			sys-apps/file[python]
			dev-python/python-magic
	)
		dev-python/pyyaml
		dev-python/secretstorage"
DEPEND="${COMMON_DEPEND}
		dev-python/setuptools
	"
RDEPEND="${COMMON_DEPEND}
	>=app-admin/pass-1.7.0"

RESTRICT="mirror"

DOCS=( CHANGELOG.rst CONTRIBUTING.rst README.md )

pkg_setup() {
	python_setup
}

src_prepare() {
	eapply_user
	python_fix_shebang .
	sed -i -e 's:python3:'${EPYTHON}':g' scripts/import.bash scripts/pimport
}

src_install() {
	default
	python_domodule pass_import
}

pkg_postinst() {
	elog "If you want to import passwords from KeePass, install pykeepass."
	elog "https://pypi.org/project/pykeepass/"
}
