# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit check-reqs

DESCRIPTION="Tables available for ophcrack"
HOMEPAGE="http://ophcrack.sourceforge.net/"
SRC_URI="xpfast? ( mirror://sourceforge/project/ophcrack/tables/XP%20free/tables_xp_free_fast.zip )
		 xpsmall? ( mirror://sourceforge/project/ophcrack/tables/XP%20free/tables_xp_free_small.zip )
		 vistafree? ( mirror://sourceforge/project/ophcrack/tables/Vista%20free/tables_vista_free.zip )
		 vistaprobafree? ( mirror://sourceforge/project/ophcrack/tables/Vista%20proba%20free/vista_proba_free.zip -> tables_vista_proba_free.zip )
	 xpspecial? (  mirror://sourceforge/project/ophcrack/tables/XP%20special/table0.bin -> xpspecial_table0.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table0.index -> xpspecial_table0.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table0.start -> xpspecial_table0.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table1.bin -> xpspecial_table1.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table1.index -> xpspecial_table1.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table1.start -> xpspecial_table1.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table2.bin -> xpspecial_table2.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table2.index -> xpspecial_table2.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table2.start -> xpspecial_table2.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table3.bin -> xpspecial_table3.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table3.index -> xpspecial_table3.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20special/table3.start -> xpspecial_table3.start
		 )
	 xpgerman? (  mirror://sourceforge/project/ophcrack/tables/XP%20german/table0.bin -> xpgerman_table0.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table0.index -> xpgerman_table0.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table0.start -> xpgerman_table0.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table1.bin -> xpgerman_table1.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table1.index -> xpgerman_table1.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table1.start -> xpgerman_table1.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table2.bin -> xpgerman_table2.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table2.index -> xpgerman_table2.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table2.start -> xpgerman_table2.start
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table3.bin -> xpgerman_table3.bin
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table3.index -> xpgerman_table3.index
		 mirror://sourceforge/project/ophcrack/tables/XP%20german/table3.start -> xpgerman_table3.start
		 )
	 vistanum? (  mirror://sourceforge/project/ophcrack/tables/Vista%20num/table0.bin -> vistanum_table0.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table0.index -> vistanum_table0.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table0.start -> vistanum_table0.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table1.bin -> vistanum_table1.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table1.index -> vistanum_table1.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table1.start -> vistanum_table1.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table2.bin -> vistanum_table2.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table2.index -> vistanum_table2.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table2.start -> vistanum_table2.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table3.bin -> vistanum_table3.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table3.index -> vistanum_table3.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20num/table3.start -> vistanum_table3.start
		 )
	 vistaspecial? (  mirror://sourceforge/project/ophcrack/tables/Vista%20special/table0.bin -> vistaspecial_table0.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table0.index -> vistaspecial_table0.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table0.start -> vistaspecial_table0.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table1.bin -> vistaspecial_table1.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table1.index -> vistaspecial_table1.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table1.start -> vistaspecial_table1.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table2.bin -> vistaspecial_table2.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table2.index -> vistaspecial_table2.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table2.start -> vistaspecial_table2.start
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table3.bin -> vistaspecial_table3.bin
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table3.index -> vistaspecial_table3.index
		 mirror://sourceforge/project/ophcrack/tables/Vista%20special/table3.start -> vistaspecial_table3.start
		 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"
IUSE="xpsmall +xpfast +vistafree +vistaprobafree xpspecial xpgerman vistanum vistaspecial"

REQUIRED_USE="|| ( xpfast xpsmall vistafree vistaprobafree xpspecial xpgerman vistanum vistaspecial )"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

pkg_setup() {

	# Determine the requirements to check for
	installsize=0
	for useflag in ${IUSE};
	do
		if use ${useflag#+}; then
			case ${useflag} in
				vistaspecial)
					installsize=$((${installsize} + 9))
					;;
				xpspecial|xpgerman)
					installsize=$((${installsize} + 8))
					;;
				vistanum)
					installsize=$((${installsize} + 4))
					;;
				*)
					installsize=$((${installsize} + 1))
			esac
		fi
	done

	CHECKREQS_DISK_BUILD="${installsize}G"
	CHECKREQS_DISK_USR="${CHECKREQS_DISK_BUILD}"

	check-reqs_pkg_setup
}

pkg_pretend() {
	pkg_setup
}

src_unpack() {
	for i in ${A};
	do
	    if [ "${i:(-4)}" == ".zip" ]; then
		table=${i#tables_}
		table=${table%.zip}
		mkdir "${S}/${table}"
		cd $_ || die
		unpack "${i}"
	    else
		filename=${i##/}
		useflag=${filename%%_*}
		[ -d "${S}/${useflag}" ] || mkdir "${S}/${useflag}"
		use ${useflag} && cp -L "${DISTDIR}/${i}" "${S}/${useflag}/${filename#_}"
	    fi
	done
}

src_install() {
	dodir /usr/share/ophcrack/
	use vistaprobafree && mv vista_proba_free/vista_proba_free/* vista_proba_free/ && rmdir vista_proba_free/vista_proba_free
	cp -r "${S}"/* "${ED}"/usr/share/ophcrack/ || die
}
