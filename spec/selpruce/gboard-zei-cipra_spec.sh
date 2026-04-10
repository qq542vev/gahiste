#!/usr/bin/env sh

### File: gboard_validation_spec.sh
##
## .i lo gboard zei liste cu te cipra
##
## Usage:
##
## ------ Text ------
## shellspec gboard_validation_spec.sh
## ------------------
##
## Metadata:
##
##   id - 79ad6194-bbc3-4567-a5bf-8efd255690cbu
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.0
##   created - 2026-04-09
##   modified - 2026-04-09
##   copyright - Copyright (C) 2026-2026 qq542vev. All rights reserved.
##   license - <GPL-3.0-only at https://www.gnu.org/licenses/gpl-3.0.txt>
##   depends - awk, find
##   conforms-to - <https://github.com/bashellspec/bashellspec/blob/master/docs/references.md>

eval "$(shellspec -) exit 1"

Describe '.i lo gboard zei liste cu te cipra'
	gboard_zei_cipra() {
		awk -F '\t' -- '
			BEGIN {
				morna_xipa = morna_xire = "^([a-gi-pr-vx-z]|([aeiou](\047[aeiou])+))+$"
				jalge = 0

				if(ARGV[1] ~ /[^\/]+-at-[^\/]+$/) {
					sub(/\^/, "^@", morna_xipa)
				} else if(ARGV[1] ~ /[^\/]+-bs-[^\/]+$/) {
					sub(/\^/, "^\\\\", morna_xipa)
				} else if(ARGV[1] ~ /[^\/]+-em-[^\/]+$/) {
					sub(/\^/, "^!", morna_xipa)
				}
			}

			NR == 1 {
				if($0 != "# Gboard Dictionary version:2") {
					printf("fliba %d (version line): [%s]\n", NR, $0)
					jalge = 1
				}

				next
			}

			NR == 2 {
				if($0 != "# Gboard Dictionary format:shortcut\tword\tlanguage_tag\tpos_tag") {
					printf("fliba %d (format line): [%s]\n", NR, $0)
					jalge = 1
				}

				next
			}

			NF != 4 || $1 !~ morna_xipa || $2 !~ morna_xire || $3 != "" || $4 != "" {
				printf("fliba %d: [%s]\n", NR, $0)
				jalge = 1
			}

			END { exit jalge }
		' "${1}" >&2
	}

	Parameters:value $(find -- "${VASRU:-selpruce}" -name 'gboard-*.txt' -type f)

	Example ".i la'o zoi ${1} zoi te cipra"
		When call gboard_zei_cipra "${1}"
		The status should eq 0
	End
End
