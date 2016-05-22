# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools systemd

EGIT_REPO_URI="https://github.com/vmware/open-vm-tools"
EGIT_BRANCH="stable-10.0.x"

DESCRIPTION="FUSE driver for Vmware's blocking/Gnome drag-and-drop support"
HOMEPAGE="https://github.com/vmware/open-vm-tools"
SRC_URI=""

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/open-vm-tools/"

src_prepare() {
  eautoreconf
}

src_configure() {
  econf --without-dnet --without-ssl --without-kernel-modules --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg || die "Failed to configure"
}

src_compile() {
  
  cd ${S}/vmblock-fuse
  make || die "Failed to compile"
}

src_install() {
  cd ${S}/vmblock-fuse
  make install DESTDIR="${ED}"

  systemd_dounit "${FILESDIR}/vmware-vmblock-fuse.service"
  systemd_newtmpfilesd "${FILESDIR}/vmware-vmblock-fuse.conf" vmware-vmblock-fuse.conf
}
