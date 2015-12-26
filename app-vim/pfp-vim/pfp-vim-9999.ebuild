# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit git-r3 vim-plugin

DESCRIPTION="vim plugin: 010 Editor template interpreter"
HOMEPAGE="https://github.com/d0c-s4vage/pfp-vim"
LICENSE="mit"
KEYWORDS="~amd64"
IUSE=""

EGIT_REPO_URI="https://github.com/d0c-s4vage/pfp-vim"

DEPEND="dev-python/pfp
		app-misc/010-editor-templates"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

