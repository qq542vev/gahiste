#!/usr/bin/env sh

### File: tsv-zei-cipra_spec.sh
##
## .i lo tsv zei vreji cu te cipra
##
## Usage:
##
## ------ Text ------
## shellspec tsv-zei-cipra_spec.sh
## ------------------
##
## Metadata:
##
##   id - c703fb1d-a38a-4745-a7cc-076d209ca5d1
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.0
##   created - 2026-04-09
##   modified - 2026-04-09
##   copyright - Copyright (C) 2026-2026 qq542vev. All rights reserved.
##   license - <GPL-3.0-only at https://www.gnu.org/licenses/gpl-3.0.txt>
##   depends - awk, find
##   conforms-to - <https://github.com/bashellspec/bashellspec/blob/master/docs/references.md>
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/gahiste>
##   * <Bug report at https://github.com/qq542vev/gahiste/issues>

eval "$(shellspec -) exit 1"

Describe '.i lo tsv zei vreji cu te cipra'
	tsv_zei_cipra() {
		awk -F '\t' -- '
			BEGIN {
				morna = "^([a-gi-pr-vx-z]|([aeiou](\047[aeiou])+))+$"
				jalge = 0
			}

			NF != 2 || $1 !~ morna || $2 !~ morna {
				printf("fliba %d: [%s]\n", NR, $0)
				jalge = 1
			}

			END { exit jalge }
		' "${1}" >&2
	}

	Parameters:value $(find -- "${VASRU:-terpruce}" -name '*.tsv' -type f)

	Example ".i la'o zoi ${1} zoi te cipra"
		When call tsv_zei_cipra "${1}"
		The status should eq 0
	End
End
