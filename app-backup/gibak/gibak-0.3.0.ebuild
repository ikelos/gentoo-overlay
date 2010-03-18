# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A backup tool based on git."
HOMEPAGE="http://eigenclass.org/hiki/gibak-backup-system-introduction/"
SRC_URI="http://eigenclass.org/static/gibak/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="xattr"

DEPEND=">=dev-lang/ocaml-3.10
	dev-util/omake"
RDEPEND=">=dev-vcs/git-1.5.4.2
	 net-misc/rsync"

src_compile() {
	use xattr && CFLAGS="${CFLAGS} -DHAVE_LINUX_XATTR"
	omake --force-dotomake --dotomake omc || die "omake failed"
}

src_install() {
	dobin find-git-files
	dobin find-git-repos
	dobin gibak
	dobin ometastore
	dodoc README.txt
}

