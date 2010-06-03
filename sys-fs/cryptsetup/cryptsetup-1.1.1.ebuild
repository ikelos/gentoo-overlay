# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/cryptsetup/cryptsetup-1.0.6-r2.ebuild,v 1.3 2008/12/07 03:11:17 vapier Exp $

EAPI=2

inherit linux-info eutils flag-o-matic multilib

MY_P=${P/_rc/-rc}
DESCRIPTION="Tool to setup encrypted devices with dm-crypt"
HOMEPAGE="http://code.google.com/p/cryptsetup/"
SRC_URI="http://cryptsetup.googlecode.com/files/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="dynamic nls selinux"

S=${WORKDIR}/${MY_P}

DEPEND=">=sys-fs/lvm2-2.02.64
	>=dev-libs/libgcrypt-1.1.42
	>=dev-libs/libgpg-error-1.0-r1
	>=dev-libs/popt-1.7
	>=sys-fs/udev-124
	|| ( >=sys-libs/e2fsprogs-libs-1.41 <sys-fs/e2fsprogs-1.41 )
	>=sys-apps/baselayout-2.0.0
	selinux? ( sys-libs/libselinux )
	!sys-fs/cryptsetup-luks"

pkg_setup() {
	local CONFIG_CHECK="~DM_CRYPT ~CRYPTO ~CRYPTO_CBC"
	local WARNING_DM_CRYPT="CONFIG_DM_CRYPT:\tis not set (required for cryptsetup)\n"
	local WARNING_CRYPTO_CBC="CONFIG_CRYPTO_CBC:\tis not set (required for kernel 2.6.19)\n"
	local WARNING_CRYPTO="CONFIG_CRYPTO:\tis not set (required for cryptsetup)\n"
	check_extra_config

	if use dynamic ; then
		ewarn "If you need cryptsetup for an initrd or initramfs then you"
		ewarn "should NOT use the dynamic USE flag"
		epause 5
	fi
}

src_configure() {
	use selinux || export ac_cv_lib_selinux_is_selinux_enabled=no
	econf \
		--sbindir=/sbin \
		--enable-shared \
		$(use_enable !dynamic static) \
		--libdir=/usr/$(get_libdir) \
		$(use_enable nls) \
		$(use_enable selinux) \
		|| die
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	rmdir "${D}"/usr/$(get_libdir)/cryptsetup
	newconfd "${FILESDIR}"/1.0.6-r3-dmcrypt.confd dmcrypt || die
	newinitd "${FILESDIR}"/1.0.6-r3-dmcrypt.rc dmcrypt || die
}

pkg_postinst() {
	ewarn "This ebuild introduces a new set of scripts and configuration"
	ewarn "than the last version.  The syntax of the dmcrypt file has changed."
	ewarn "You *MUST* configure your new dmcrypt file at:"
	ewarn "/etc/conf.d/dmcrypt"
	ewarn "Or your encrypted partitions will *NOT* work."
	elog "Please see the example for configuring a LUKS mountpoint"
	elog "in /etc/conf.d/dmcrypt"
	elog
	elog "If you are using baselayout-2 then please do:"
	elog "rc-update add dmcrypt boot"
	elog "This version introduces a command line arguement 'key_timeout'."
	elog "If you want the search for the removable key device to timeout"
	elog "after 10 seconds add the following to your bootloader config:"
	elog "key_timeout=10"
	elog "A timeout of 0 will mean it will wait indefinitely."
}
