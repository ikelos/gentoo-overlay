# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	argh-0.1.4
	argh_derive-0.1.4
	argh_shared-0.1.4
	atty-0.2.14
	autocfg-1.0.1
	byteorder-1.3.4
	bytesize-1.0.1
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	crossbeam-queue-0.3.1
	crossbeam-utils-0.8.1
	env_logger-0.8.2
	fnv-1.0.7
	hashbrown-0.9.1
	heck-0.3.2
	hermit-abi-0.1.17
	indexmap-1.6.1
	itoa-0.4.7
	lazy_static-1.4.0
	libc-0.2.81
	log-0.4.11
	mio-0.7.6
	miow-0.3.6
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.0
	paste-1.0.4
	proc-macro2-1.0.24
	quote-1.0.8
	rmp-0.8.9
	rmp-serde-0.15.0
	ryu-1.0.5
	serde-1.0.118
	serde_derive-1.0.118
	serde_json-1.0.60
	serde_repr-0.1.6
	socket2-0.3.19
	syn-1.0.56
	termcolor-1.1.2
	time-0.1.44
	unicode-segmentation-1.7.1
	unicode-xid-0.2.1
	wasi-0.10.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="The server component that FunctionTrace clients will spawn and connect to"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://gitlab.com/mbryant/functiontrace"
SRC_URI="https://gitlab.com/mbryant/functiontrace/-/archive/master/functiontrace-master.tar.bz2
$(cargo_crate_uris)"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/functiontrace-master"
