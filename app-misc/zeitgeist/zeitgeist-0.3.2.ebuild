# Copyright 1999-2009 Tiziano Mueller
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib python versionator bash-completion

DESCRIPTION="Service which logs the users's activities and events."
HOMEPAGE="http://launchpad.net/zeitgeist"
SRC_URI="http://launchpad.net/zeitgeist/$(get_version_component_range 1-2)/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-3 GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion doc"

RDEPEND=">=dev-lang/python-2.6[sqlite]
	sys-apps/dbus
	dev-python/pygobject
	dev-python/gconf-python
	dev-python/pyxdg
	dev-python/pygtk"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	doc? ( dev-python/sphinx )"

src_prepare() {
	ln -sf $(type -P true) py-compile || die "replacing py-compile failed"
}

src_compile() {
	default

	if use doc ; then
		cd doc/zeitgeist
		emake html || die "building docs failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO

	python_need_rebuild

	dobashcompletion extra/zeitgeist-daemon.bash_completion zeitgeist-daemon

	use doc && dohtml -r doc/zeitgeist/build/html/*
}

pkg_postinst() {
	python_version
	python_mod_optimize \
		"/usr/$(get_libdir)/python${PYVER}/site-packages/zeitgiest" \
		"/usr/share/zeitgeist"

	bash-completion_pkg_postinst
}

pkg_postrm() {
	python_version
	python_mod_cleanup \
		"/usr/$(get_libdir)/python${PYVER}/site-packages/zeitgeist" \
		"/usr/share/zeitgeist"
}

