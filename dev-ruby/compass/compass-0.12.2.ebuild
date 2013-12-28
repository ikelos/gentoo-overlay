# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="An open-source CSS Authoring Framework"
HOMEPAGE="http://compass-style.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RUBY_FAKEGEM_EXTRAINSTALL="features frameworks examples"

ruby_add_rdepend "dev-ruby/sass"
ruby_add_rdepend "dev-ruby/chunky_png"
ruby_add_rdepend "dev-ruby/fssm"
