#!/usr/bin/env sh

### File: zip-zei-cipra_spec.sh
##
## .i lo zip zei vreji cu te cipra
##
## Usage:
##
## ------ Text ------
## shellspec spec/zip-zei-cipra_spec.sh
## ------------------
##
## Metadata:
##
##   id - e3b5f6a1-d8c2-4e4f-9b2a-7d1c6e5f4a32
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.0
##   created - 2026-04-13
##   modified - 2026-04-13
##   copyright - Copyright (C) 2026-2026 qq542vev. All rights reserved.
##   license - <GPL-3.0-only at https://www.gnu.org/licenses/gpl-3.0.txt>
##   depends - find, unzip
##   conforms-to - <https://github.com/bashellspec/bashellspec/blob/master/docs/references.md>

eval "$(shellspec -) exit 1"

Describe '.i lo zip zei vreji cu te cipra'
	zip_zei_prane_cipra() {
		unzip -t "${1}" >/dev/null 2>&1
	}

	zip_zei_vasru_cipra() {
		ime=${1%.*}
		ime=${ime##*-}

		[ "$(unzip -Z -1 "${1}" | LANG=C sort)" = "$({ echo 'LICENSE.txt'; find -- "${VASRU:-selpruce}" -name "${ime}-*.txt" -type f; } | LANG=C sort)" ]
	}

	Parameters:value $(find -- "${VASRU:-selpruce}" -name '*.zip' -type f)

	Example ".i la'o zoi ${1} zoi prane te cipra"
		When call zip_zei_prane_cipra "${1}"
		The status should eq 0
	End

	Example ".i la'o zoi ${1} zoi se vasru te cipra"
		When call zip_zei_vasru_cipra "${1}"
		The status should eq 0
	End
End
