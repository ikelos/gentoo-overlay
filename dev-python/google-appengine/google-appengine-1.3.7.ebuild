# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit python

DESCRIPTION="Google App Engine SDK for Python"
HOMEPAGE="http://appengine.google.com/"
SRC_URI="http://${PN/-/}.googlecode.com/files/${PN/-/_}_${PV}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=">=dev-python/django-1.2
		>=dev-python/pyyaml-3
		>=dev-python/webob-1"
RDEPEND="${DEPEND}"

PYTHON_DEPEND="2"

S="${WORKDIR}/${PN/-/_}"

src_prepare(){
	sed -i -e "s#^DIR_PATH = .*\$#DIR_PATH = '/usr/share/${PN}'#" \
		-e 's#/usr/bin/env python#/usr/bin/python2.5#' *.py \
		|| die "sed failed"
}

src_install(){
	insinto $(python_get_sitedir)
	doins -r google || die "install failed"

	insinto /usr/share/${PN}
	doins -r templates VERSION || die "install failed"

	if use examples ; then
		insinto /usr/share/${PN}/examples
		doins -r demos new_project_template || die "install examples failed"
	fi

	dobin *.py
	dodoc BUGS README RELEASE_NOTES
}

pkg_postinst(){
	elog
	elog "The images api uses the Python Imaging Library locally to transform"
	elog "images during testing on your local machine. You'll need to install"
	elog "dev-python/imaging to use the imaging api with the SDK."
	elog
}
