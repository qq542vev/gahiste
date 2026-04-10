#!/usr/bin/make -f

### File: makefile
##
## zbasu lo galfi liste be pi'o la'o zoi IME zoi
##
## Usage:
##
## ------ Text ------
## make -f makefile
## ------------------
##
## Metadata:
##
##   id - cb29c2da-5cf5-4032-a0ce-bfbc95a8d927
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 0.6.1
##   created - 2026-03-28
##   modified - 2026-04-06
##   copyright - Copyright (C) 2026-2026 qq542vev. All rights reserved.
##   license - <GPL-3.0-only at https://www.gnu.org/licenses/gpl-3.0.txt>
##   depends - awk, curl, echo, find, git, glab, rm, shellspec, sort, zip
##   conforms-to - <https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html>
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/kanajbo>
##   * <Bug report at https://github.com/qq542vev/kanajbo/issues>

# Sp Targets
# ==========

.POSIX:

.PHONY: ro gboard cipra terpruce-cipra selpruce-cipra vimcu zahurehu gubni mipri sidju velfarvi

.SILENT: sidju velfarvi

# Macro
# =====

CMENE = gahiste
NAMCU = 1.2.0
SELPRUCE = selpruce
TERPRUCE = terpruce

# terpruce
# --------

GIMRAFSTE = $(TERPRUCE)/gimrafsi.tsv
MAHORAFSTE = $(TERPRUCE)/mahorafsi.tsv
BAISTE = $(TERPRUCE)/bai.tsv
FAHASTE = $(TERPRUCE)/faha.tsv
PURSTE = $(TERPRUCE)/pu.tsv
VIHASTE = $(TERPRUCE)/viha.tsv
TAHESTE = $(TERPRUCE)/tahe.tsv
ROISTE = $(TERPRUCE)/roi.tsv
NUNSTE = $(TERPRUCE)/nu.tsv
CAISTE = $(TERPRUCE)/cai.tsv
BAHESTE = $(TERPRUCE)/bahe.tsv
FAHOSTE = $(TERPRUCE)/faho.tsv
NAHESTE = $(TERPRUCE)/nahe.tsv

# cmene morna
# -----------

ROLSINXA = at bs em ziho
GIMRAF = $(ROLSINXA:%=-%-gismu-rafsi.txt)
RAFGIM = $(ROLSINXA:%=-%-rafsi-gismu.txt)
MAHORAF = $(ROLSINXA:%=-%-cmavo-rafsi.txt)
RAFMAHO = $(ROLSINXA:%=-%-rafsi-cmavo.txt)
GIMBAI = $(ROLSINXA:%=-%-gismu-bai.txt)
BAIGIM = $(ROLSINXA:%=-%-bai-gismu.txt)
GIMFAHA = $(ROLSINXA:%=-%-gismu-faha.txt)
FAHAGIM = $(ROLSINXA:%=-%-faha-gismu.txt)
GIMPUR = $(ROLSINXA:%=-%-gismu-pu.txt)
PURGIM = $(ROLSINXA:%=-%-pu-gismu.txt)
GIMVIHA = $(ROLSINXA:%=-%-gismu-viha.txt)
VIHAGIM = $(ROLSINXA:%=-%-viha-gismu.txt)
GIMTAHE = $(ROLSINXA:%=-%-gismu-tahe.txt)
TAHEGIM = $(ROLSINXA:%=-%-tahe-gismu.txt)
GIMROI = $(ROLSINXA:%=-%-gismu-roi.txt)
ROIGIM = $(ROLSINXA:%=-%-roi-gismu.txt)
GIMNUN = $(ROLSINXA:%=-%-gismu-nu.txt)
NUNGIM = $(ROLSINXA:%=-%-nu-gismu.txt)
GIMCAI = $(ROLSINXA:%=-%-gismu-cai.txt)
CAIGIM = $(ROLSINXA:%=-%-cai-gismu.txt)
GIMBAHE = $(ROLSINXA:%=-%-gismu-bahe.txt)
BAHEGIM = $(ROLSINXA:%=-%-bahe-gismu.txt)
GIMFAHO = $(ROLSINXA:%=-%-gismu-faho.txt)
FAHOGIM = $(ROLSINXA:%=-%-faho-gismu.txt)
GIMNAHE = $(ROLSINXA:%=-%-gismu-tohe.txt)
NAHEGIM = $(ROLSINXA:%=-%-tohe-gismu.txt)
ROLSTE = $(GIMRAF) $(RAFGIM) $(MAHORAF) $(RAFMAHO) $(GIMBAI) $(BAIGIM) $(GIMFAHA) $(FAHAGIM) $(GIMPUR) $(PURGIM) $(GIMVIHA) $(VIHAGIM) $(GIMTAHE) $(TAHEGIM) $(GIMROI) $(ROIGIM) $(GIMNUN) $(NUNGIM) $(GIMCAI) $(CAIGIM) $(GIMBAHE) $(BAHEGIM) $(GIMFAHO) $(FAHOGIM) $(GIMNAHE) $(NAHEGIM)

# minde
# -----

MKDIR = mkdir -p -- '$(@D)'
SET = set -efu -o pipefail
BREDI = \
	$(SET); $(MKDIR); \
	case '$(@F)' in \
		*'-at-'*) export SINXA='@';; \
		*'-bs-'*) export SINXA='\';; \
		*'-em-'*) export SINXA='!';; \
		*'-ziho-'*) export SINXA='';; \
	esac;
ZIP = zip -9FS '$(@)' $(^)

# Gboard
# ------

GBOARD_LISTE = $(ROLSTE:%=$(SELPRUCE)/gboard%)
GBOARD_ZIP = $(SELPRUCE)/$(CMENE)-$(NAMCU)-gboard.zip
GBOARD_ZBASU = { \
	echo '\# Gboard Dictionary version:2'; \
	echo '\# Gboard Dictionary format:shortcut	word	language_tag	pos_tag'; \
	awk -F '\t' -- '{ printf("%s\t%s\t\t\n", ENVIRON["SINXA"] $$1, $$2); }' | LANG=C sort; \
} >'$(@)'
GBOARD_XIPA = $(BREDI) $(GBOARD_ZBASU) <'$(<)'
GBOARD_XIRE = $(BREDI) awk -- '{ printf("%s\t%s\n", $$2, $$1); }' '$(<)' | $(GBOARD_ZBASU)

# zbasu
# =====

ro: gboard

# Gboard
# ------

gboard: $(GBOARD_ZIP)

$(GBOARD_ZIP): $(GBOARD_LISTE)
	$(ZIP)

$(GIMRAF:%=$(SELPRUCE)/gboard%): $(GIMRAFSTE)
	$(GBOARD_XIPA)

$(RAFGIM:%=$(SELPRUCE)/gboard%): $(GIMRAFSTE)
	$(GBOARD_XIRE)

$(MAHORAF:%=$(SELPRUCE)/gboard%): $(MAHORAFSTE)
	$(GBOARD_XIPA)

$(RAFMAHO:%=$(SELPRUCE)/gboard%): $(MAHORAFSTE)
	$(GBOARD_XIRE)

$(GIMBAI:%=$(SELPRUCE)/gboard%): $(BAISTE)
	$(GBOARD_XIPA)

$(BAIGIM:%=$(SELPRUCE)/gboard%): $(BAISTE)
	$(GBOARD_XIRE)

$(GIMFAHA:%=$(SELPRUCE)/gboard%): $(FAHASTE)
	$(GBOARD_XIPA)

$(FAHAGIM:%=$(SELPRUCE)/gboard%): $(FAHASTE)
	$(GBOARD_XIRE)

$(GIMPUR:%=$(SELPRUCE)/gboard%): $(PURSTE)
	$(GBOARD_XIPA)

$(PURGIM:%=$(SELPRUCE)/gboard%): $(PURSTE)
	$(GBOARD_XIRE)

$(GIMVIHA:%=$(SELPRUCE)/gboard%): $(VIHASTE)
	$(GBOARD_XIPA)

$(VIHAGIM:%=$(SELPRUCE)/gboard%): $(VIHASTE)
	$(GBOARD_XIRE)

$(GIMTAHE:%=$(SELPRUCE)/gboard%): $(TAHESTE)
	$(GBOARD_XIPA)

$(TAHEGIM:%=$(SELPRUCE)/gboard%): $(TAHESTE)
	$(GBOARD_XIRE)

$(GIMROI:%=$(SELPRUCE)/gboard%): $(ROISTE)
	$(GBOARD_XIPA)

$(ROIGIM:%=$(SELPRUCE)/gboard%): $(ROISTE)
	$(GBOARD_XIRE)

$(GIMNUN:%=$(SELPRUCE)/gboard%): $(NUNSTE)
	$(GBOARD_XIPA)

$(NUNGIM:%=$(SELPRUCE)/gboard%): $(NUNSTE)
	$(GBOARD_XIRE)

$(GIMCAI:%=$(SELPRUCE)/gboard%): $(CAISTE)
	$(GBOARD_XIPA)

$(CAIGIM:%=$(SELPRUCE)/gboard%): $(CAISTE)
	$(GBOARD_XIRE)

$(GIMBAHE:%=$(SELPRUCE)/gboard%): $(BAHESTE)
	$(GBOARD_XIPA)

$(BAHEGIM:%=$(SELPRUCE)/gboard%): $(BAHESTE)
	$(GBOARD_XIRE)

$(GIMFAHO:%=$(SELPRUCE)/gboard%): $(FAHOSTE)
	$(GBOARD_XIPA)

$(FAHOGIM:%=$(SELPRUCE)/gboard%): $(FAHOSTE)
	$(GBOARD_XIRE)

$(GIMNAHE:%=$(SELPRUCE)/gboard%): $(NAHESTE)
	$(GBOARD_XIPA)

$(NAHEGIM:%=$(SELPRUCE)/gboard%): $(NAHESTE)
	$(GBOARD_XIRE)

# drata
# -----

LICENSE.txt:
	curl -sSfLo '$(@)' -- 'https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt'

# cipra
# =====

cipra: terpruce-cipra selpruce-cipra

terpruce-cipra:
	VASRU='$(TERPRUCE)' shellspec spec/tsv-zei-cipra_spec.sh

selpruce-cipra: ro
	VASRU='$(SELPRUCE)' shellspec spec/selpruce

# vimcu
# =====

vimcu:
	rm -f -- $(GBOARD_LISTE:%='%') '$(GBOARD_ZIP)'

zahurehu: vimcu
	$(MAKE)

# gubni
# =====

gubni: ro
	glab release create '$(NAMCU)' --name ".i li $(NAMCU) velfarvi sinxa" --notes "$$(git tag -l '$(NAMCU)' --format='%(contents)')" --no-update --use-package-registry $$(find "$(SELPRUCE)" -name '*.zip' -type f | LANG=C sort)

mipri:
	if glab release view '$(NAMCU)' >/dev/null 2>&1; then \
		glab release delete '$(NAMCU)' -y; \
	fi

# notci
# =====

sidju:
	echo "zbasu lo galfi liste be pi'o la'o zoi IME zoi"
	echo
	echo "pilno tadji:"
	echo "  make [OPTION...] [MACRO=VALUE...] [TARGET...]"
	echo
	echo "TARGET:"
	echo "  ro       zbasu ro da"
	echo "  gboard   zbasu lo se pilno be la'o zoi Gboard zoi"
	echo "  cipra    ro da te cipra"
	echo "  terpruce-cipra"
	echo "           lo te pruce cu te cipra"
	echo "  selpruce-cipra"
	echo "           lo se pruce cu te cipra"
	echo "  vimcu    vimcu lo se zbasu"
	echo "  zahurehu za'u re'u zbasu"
	echo "  gubni    lo se zbasu cu co'a gubni"
	echo "  mipri    mipri lo gubni"
	echo "  sidju    jarco tu'a lo ti sidju notci"
	echo "  velfarvi jarco tu'a lo ve farvi datni"

velfarvi:
	echo '$(NAMCU)'
