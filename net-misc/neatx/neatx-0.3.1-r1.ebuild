# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools distutils subversion

ESVN_REPO_URI="http://neatx.googlecode.com/svn/tags/neatx/${P}/"

DESCRIPTION="Google implementation of NX server"
HOMEPAGE="http://code.google.com/p/neatx/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="${CDEPEND}
        dev-python/docutils"
CDEPEND="dev-lang/python"
RDEPEND="${CDEPEND}
		 dev-python/pexpect
		 dev-python/simplejson
		 >=dev-python/pygtk-2.14
		 >=dev-python/pygobject-2.14
		 net-analyzer/netcat"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -i -e "s/rst2html]/rst2html.py]/" ${S}/configure.ac
	eautoreconf
	# This is for bug 215944, so .pyo/.pyc files don't get into the
	# file system
	mv "${S}"/autotools/py-compile "${S}"/autotools/py-compile.orig
	ln -s $(type -P true) "${S}"/autotools/py-compile
}

pkg_setup () {
	if [ -z "${NX_HOME_DIR}" ];
	then
		export NX_HOME_DIR=/var/lib/nxserver/home
	fi
	enewuser nx -1 -1 ${NX_HOME_DIR}
}

src_compile() {
	default_src_compile
}

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}

pkg_postinst () {
	distutils_pkg_postinst
	# Other NX servers ebuilds may have already created the nx account
	# However they use different login shell/home directory paths
	if [[ ${ROOT} == "/" ]]; then
		usermod -s /usr/lib/neatx/nxserver-login nx || die "Unable to set login shell of nx user!!"
		usermod -d ${NX_HOME_DIR} nx || die "Unable to set home directory of nx user!!"
	else
		elog "If you had another NX server installed before, please make sure"
		elog "the nx user account is correctly set to:"
		elog " * login shell: /usr/lib/neatx/nxserver-login"
		elog " * home directory: ${NX_HOME_DIR}"
	fi

	if ! built_with_use net-misc/openssh pam; then
		elog ""
		elog "net-misc/openssh was not built with PAM support"
		elog "You will need to unlock the nx account by setting a password for it"
	fi
}
